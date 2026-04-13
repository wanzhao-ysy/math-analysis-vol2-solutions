print "============= I am memoize's latexmkrc.  John Collins 2024-03-29\n";

# This rc file shows how to use latexmk with the memoize package.
#
# The memoize package (https://www.ctan.org/pkg/memoize) implements
# externalization and memoization of sections of code in a TeX document.
# It allows the compilation of the document to reuse results of
# compilation-intensive code, with a consequent speeding up of runs of
# *latex.  Such compilation intensive code is commonly encountered, for
# example, in making pictures by TikZ.
#
# When a section of code to be memoized is encountered, an extra page is
# inserted in the document's pdf file containing the results of the
# compilation of the section of code. Then a script, memoize-extract.pl or
# memoize-extract.py, is run to extract the extra parts of the the
# document's pdf file to individual pdf files (called externs).  On the
# next compilation by *latex, those generated pdf files are used in place
# of actually compiling the corresponding code (unless the section of code
# has changed).
#
# This latexmkrc file supports this process by configuring latexmk so that
# when a compilation by *latex is done, a memoize-extract script is run
# immediately afterwards.  If any new externs are generated, latexmk
# notices that and triggers a new compilation, as part of its normal mode
# of operation.
#
# The memoize package itself also runs memoize-extract at the start of each
# compilation. If latexmk has already run memoize-extract, that extra run
# of memoize-extract finds that it has nothing to do.  The solution here is
# more general: (a) It handles the case where the memoize package is
# invoked in the .tex file with the external=no option.  (b) It handles the
# situation where the aux and out directories are different, which is not
# the case for the built-in invocation.  (c) It nicely matches with
# latexmk's general methods of determining how many runs of *latex are
# needed.
#
#  Needs latexmk v. >= 4.84, memoize >= 1.2.0 (2024/03/15).
#  TeX Live 2024 (or later, presumably).
#  Tested on TeX Live 2024 on macOS, Ubuntu, Windows,
#      with pdflatex, lualatex, and xelatex.
#  Needs perl module PDF::API2 to be installed.
#  On TeXLive on Windows, also put
#      TEXLIVE_WINDOWS_TRY_EXTERNAL_PERL = 1
#  in the texmf.cnf file in the root directory of the TeX Live installation.

# ==> However, there are some anomalies on Windows, which haven't been sorted out
#     yet.  These notably concern memoize-clean
#
# ==> Fails on MiKTeX on Windows: memoize-extract refuses to create pdf file????
#            I haven't yet figured out the problem.
# ==> Also trouble on MiKTeX on macOS: the memoize-extract.pl.exe won't run.

# You can have separate build and output directories, e.g., by
    #$out_dir = 'output';
    #$aux_dir = 'build';
# or they can be the same, e.g., by
     # $out_dir = $aux_dir = 'output';


# Which program and extra options to use for memoize-extract and memoize-clean.
# Note that these are arrays, not simple strings.
our @memoize_extract = ( 'memoize-extract.pl' );
our @memoize_clean = ( 'memoize-clean.pl' );

# Specification of the basic memoize files to delete in a clean-up
# operation. The generated .memo and .pdf files have more specifications,
# and we use memoize-clean to delete those, invoked by a cleanup hook.
push @generated_exts, 'mmz', 'mmz.log';

# Subroutine mmz_analyzes analyzes .mmz file, if it exists **and** was
# generated in current compilation, to determine whether there are new
# extern pdfs to be generated from memo files and pdf file.  Communicate
# to subtroutine mmz_extract_new a need to make new externs by setting the
# variable to a non-zero value for $mmz_has_new.  Let the value be the
# name of the mmz file; this is perhaps being too elaborate, since the
# standard name of the mmz file can be determined

add_hook( 'after_xlatex_analysis', \&mmz_analyze );
add_hook( 'after_main_pdf', \&mmz_extract_new );

# !!!!!!!!!!!!!!!!!!!! Uncomment the following line **only** if you really
# want latexmk's cleanup operations to delete Memoize's memoization
# files. In a document where these files are time-consuming to make, i.e.,
# in the main use case for the memoize package, the files are precious and
# should only need deleted when that is really needed. 
#
# add_hook( 'cleanup', \&mmz_cleanup );

# Whether there are new externs to be made:
my $mmz_has_new = '';
#     Scope of this variable: private, from here to end of file.


#-----------------------------------------------------

sub mmz_analyze {
    use strict;
    print "============= I am mmz_analyze \n";
    print "  Still to deal with provoking of rerun if directory made\n";

    # Analyzes mmz file if generated on this run.
    # Then 1. Arranges to trigger making of missing extern pdfs, if needed.
    #      2. Sets dependencies on the extern pdfs. This ensures that, in
    #         the case that one or more extern pdfs does not currently
    #         exist, a rerun of *latex will triggered after it/they get
    #         made. 
    # Return zero on success (or nothing to do), and non-zero otherwise.

    # N.B. Current (2024-03-11) hook implementation doesn't use return
    #      values from hook subroutines. Future implementation might.
    #      So I'll provide a return value.

    my $base = $$Pbase;
    my $mmz_file = "$aux_dir1$base.mmz";

    # Communicate to subroutine mmz_extract_new about whether new extern
    #   pdf(s) are to be made.  Default to assuming no externs are to be
    #   made:
    $mmz_has_new = '';
    
    if (! -e $mmz_file) {
        print "mmz_analyze: No mmz file '$mmz_file', so memoize is not being used.\n";
        return 0;
    }

    # Use (not-currently-documented) latexmk subroutine to detemine 
    #   whether mmz file was generated in current run: 
    if ( ! test_gen_file_time( $mmz_file) ) {
        warn "mmz_analyze: Mmz file '$mmz_file' exists, but wasn't generated\n",
             "  on this run so memoize is not **currently** being used.\n";
        return 0;
    }

    # Get dependency information.
    # We need to cause not-yet-made extern pdfs to be trated as source
    # files for *latex.
    my $mmz_fh = undef;
    if (! open( $mmz_fh, '<', $mmz_file ) ) {
        warn "mmz_analyze: Mmz file '$mmz_file' exists, but I can't read it:\n",
        "  $!\n";
        return 1;
    }
    my @externs = ();
    my @dirs = ();
    while ( <$mmz_fh> ) {
         s/\s*$//;           # Remove trailing space, including new lines
         if ( /^\\mmzNewExtern\s+{([^}]+)}/ ) {
             # We have a new memo item without a corresponding pdf file.
             # It will be put in the aux directory. 
             my $file = "$aux_dir1$1";
             print "mmz_analyze: new extern for memoize: '$file'\n";
             push @externs, $file;
         }
         elsif ( /^\\mmzPrefix\s+{([^}]+)}/ ) {
             # Prefix.
             my $prefix = $1;
             if ( $prefix =~ m{^(.*)/[^/]*} ) {
                 my $dir = $1;
                 push @dirs, "$aux_dir1$1";

             }
         }
    }
    close $mmz_fh;
    foreach (@dirs) {
        if ( ! -e ) {
            my @cmd = ( @memoize_extract, '--mkdir', $_ ); 
            print "mmz_analyze: Making directory '$_' safely by running\n",
                  " @cmd\n";
            mkdir $_;
        }        
    }

    rdb_ensure_files_here( @externs );
    
    # .mmz.log is read by Memoize package after it does an internal
    # extract, so it appears as an INPUT file in .fls.  But it was created
    # earlier in the same run by memoize-extract, so it's not a true
    # dependency, and should be removed from the list of source files:
    rdb_remove_files( $rule, "$mmz_file.log" );

    if (@externs ) {
        $mmz_has_new = $mmz_file;
    }
    return 0; 
}

#-----------------------------------------------------

sub mmz_extract_new {
    use strict;
    print "============= I am mmz_extract_new \n";

    # If there are new extern pdf files to be made, run memoize-extract to
    #    make them.
    # Situation on entry:
    #   1. I'm in the context of a rule for making the document's pdf file.
    #      When new extern pdf files are to be made, the document's pdf
    #      file contains the pages to be extracted by memoize-extract.
    #      Given the rule context, the name of the document's pdf file is
    #      $$Pdest.
    #   2. $mmz_has_new was earlier set to the name of the mmz file with
    #      the information on the files used for memoization, but only if
    #      there are new extern pdf(s) to be made.
    #   3. If it is empty, then no extern pdfs are to be made.  This covers
    #      the case that the memoize package isn't being used.
    # Return zero on success (or nothing to do), and non-zero otherwise.
    
    if ( $mmz_has_new eq '' ) { return 0; }

    my $mmz_file = $mmz_has_new;
    my ($mmz_file_no_path, $path) = fileparse( $mmz_file );
    my $pdf_file = $$Pdest;

    # The directory used by memoize-extract for putting the generated
    #   extern pdfs is passed in the TEXMF_OUTPUT_DIRECTORY environment
    #   variable.  (The need for this way of passing information is
    #   associated with some security restrictions that apply when
    #   memoize-extract is called directly from the memoize package in a
    #   *latex compilation.)  
    local $ENV{TEXMF_OUTPUT_DIRECTORY} = $aux_dir;
    for ('TEXMF_OUTPUT_DIRECTORY') {
        print "mmz_extract_new : ENV{$_} = '$ENV{$_}'\n";
    }
    # So we should give the name of the mmz_file to memoize-extract without
    #   the directory part.    
    my @cmd = (@memoize_extract, '--format', 'latex',
                    '--pdf', $pdf_file, $mmz_file_no_path ); 

    if ( ! -e $pdf_file ) {
        warn "mmz_extract_new: Cannot generate externs here, since no pdf file generated\n";
        return 1;
    }
    elsif ( ! test_gen_file($pdf_file) ) {
        warn "mmz_extract_new: Pdf file '$pdf_file' exists, but wasn't\n",
             "  generated on this run.  I'll run memoize-extract.  Pdf file may contain\n",
             "  extra pages generated by the memoize package.\n";
        return 1;
    }
    print "make_extract_new: Running\n @cmd\n";
    return system @cmd;
}

#-----------------------------------------------------

sub mmz_cleanup {
    use strict;
    print "============= I am mmz_cleanup \n";
    my @cmd = ( @memoize_clean, '--all', '--yes',
                      '--prefix', $aux_dir, 
                      "$aux_dir1$$Pbase.mmz" );
    print "mmz_cleanup: Running\n @cmd\n";
    my $ret = system @cmd;
    say "Return code $ret";
    return $ret;
}

#-----------------------------------------------------
