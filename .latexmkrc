# $pdf_previewer = "start xpdf -remote %R %O %S";
$pdf_previewer = 'start zathura';

$pdf_update_method = 4;

$pdf_mode=1;
$print_type='pdf';
$show_time=1;

$pdflatex = 'pdflatex -synctex=1 -shell-escape -file-line-error -interaction=nonstopmode -halt-on-error -output-directory=out';
$out_dir='out';
@default_files = ('root.tex');

# For the minted package (which does nice formatting of source code):
#
# 1. Need to use -shell-escape on *latex command.
# 2. Need to arrange passing of the output dir (actually aux dir if it
#    differs from out dir) to minted.  Then this directory information does
#    not have to be specified  in the .tex file itself.
# 3. In some cases, latexmk does an extra run of *latex than is
#    needed.  This is solved by getting latexmk to ignore certain lines in
#    the aux file when latexmk looks for changes.  These lines are written
#    by minted and are irrelevant to the output file from *latex.
#
#    The reason for the extra run of *latex that may happen is because
#    after minted runs pygmentize to make the nicely formatted source code,
#    minted saves cached information about the run(s) of pygmentize. This
#    information is  put in the aux file. So latexmk sees the changed aux
#    file, and knows that may affect the output of *latex, which it
#    therefore reruns. However the minted-written lines do not affect the
#    output of *latex.
#
# The method works if the aux dir's name contains a string of MORE than one 
# space That's a problem in minted's calls to pygmentize.
# Single spaces in the name are OK.
# Generally it helps to  use only aux_dir and out_dir names  without spaces,
# to avoid trouble. 

&set_tex_cmds( '-shell-escape %O '
    . '\'\PassOptionsToPackage{outputdir={%Y}}{minted}\input{%S}\''
);
$hash_calc_ignore_pattern{aux} = '^\\\\gdef\\\\minted@oldcachelist\{,'.
    '|^\s*default\.pygstyle,'.
    '|^\s*[[:xdigit:]]+\.pygtex';
# $pdf_update_command = "xpdf -remote %R -reload";
# $aux_dir = 'out';

# $print_type = 'pdf';
# $pdf_mode = 1;
# $bibtex_use = 2;
# push @generated_exts, "cb";
# push @generated_exts, "cb2";
# push @generated_exts, "spl";
# push @generated_exts, "nav";
# push @generated_exts, "snm";
# push @generated_exts, "tdo";
# push @generated_exts, "nmo";
# push @generated_exts, "brf";
# push @generated_exts, "nlg";
# push @generated_exts, "nlo";
# push @generated_exts, "nls";
# push @generated_exts, "synctex.gz";
# push @generated_exts, "tex.latexmain";
# push @generated_exts, "run.xml";
# $latex = 'latex --src-specials %O %S';
# $pdflatex = 'pdflatex -file-line-error -synctex=1 -interaction=nonstopmode -shell-escape %O %S';
#
# $new_viewer_always = 0;
# $pdf_update_method = 2;
# $pdf_update_signal = 'SIGHUP';
#
$clean_ext = "bbl nav out snm aux dvi log bbl blg brf fls toc thm out fdb_latexmk maf mtc pdf lof lot lol listing gz nav snm vrb xdv synctex";

# add_cus_dep('nlo', 'nls', 0, 'nlo2nls');
# sub nlo2nls {
#   system("makeindex $_[0].nlo -s nomencl.ist -o $_[0].nls -t $_[0].nlg" );
# }
