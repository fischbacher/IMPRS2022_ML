#!/bin/sh

# Produces LaTeX from IPython notebooks and other pieces, and
# subsequently copies TeX sources over to the arxiv/ directory.  This
# requires some packages to be installed -- nbconvert, pandoc, etc.

rm -rf TYPESETTING
cp -a NOTEBOOKS TYPESETTING
jupyter nbconvert --to latex TYPESETTING/ML_01_Python.ipynb
jupyter nbconvert --to latex TYPESETTING/ML_02_Derivatives.ipynb
jupyter nbconvert --to latex TYPESETTING/ML_03_MachineLearning.ipynb
jupyter nbconvert --to latex TYPESETTING/ML_04_MachineLearningWithTF.ipynb
jupyter nbconvert --to latex TYPESETTING/ML_05_TF_Physics.ipynb
jupyter nbconvert --to latex TYPESETTING/ML_06_Advanced.ipynb

cp bibliography.bib TYPESETTING/
cp titlepage.txt TYPESETTING/titlepage.tex
pandoc -f markdown -t latex preface.md > TYPESETTING/preface.tex


(cd TYPESETTING; perl > ML_ALL.tex -0777 -ne \
  'BEGIN {$bib=`cat bibliography.bib`; $bb=$bib; $bb=~s/^% (http\S+)\n\@\w+\{([^,]+),/$btable{$1}=$2/emg;
   sub ctransform {
     my($h, $u, $t)=@_; $c = $btable{$u};
     if ($c) {return sprintf "%s \\cite{%s}", $h, $c;} else {return $h;}}}
   $t=$_; $t=~s/\\maketitle//g; $t=~s/BEGIN._EXCLUDE._FROM._NOTES.*?END._EXCLUDE._FROM._NOTES//sg;
   push @d, $t;
   END {
     $main=shift @d; for my $p (@d) {
      $p=~/\\begin\{document\}(.*)\\end\{document\}/s or die "Bad doc!";
      $part=$1; $main=~s/(\\end\{document\})/"${part}${1}"/e
     }
   $titlepage=`cat titlepage.tex`;
   $preface=`cat preface.tex`;
   $main=~s/(\\begin\{document\})/"${1}\n${titlepage}\n${preface}"/e;
   $main=~s/(\\href\{(.*?)\}\{(.*?)\})/ctransform($1, $2, $3)/seg;
   $main=~s/(\\end\{document\})/"\\bibliographystyle{plain}\n\\bibliography{bibliography}\n$1"/e;
   print $main;}' \
   ML_01_*.tex ML_02_*.tex ML_03_*.tex ML_04_*.tex ML_05_*.tex ML_06_*.tex)

(cd TYPESETTING; pdflatex ML_ALL.tex; bibtex ML_ALL; pdflatex ML_ALL.tex; pdflatex ML_ALL.tex)
(rm -rf arxiv; mkdir arxiv; mkdir arxiv/anc;
 cp mnist_model.{tflite,onnx} arxiv/anc/;
 perl -0777 -ape 's%\\bibliographystyle\{plain\}\n\\bibliography\{bibliography\}\n%`cat TYPESETTING/ML_ALL.bbl`%e' \
   TYPESETTING/ML_ALL.tex > arxiv/ML_ALL.tex
 cp -a TYPESETTING/ML_*_files arxiv/;
 cp -a NOTEBOOKS arxiv/anc/;
 cp TEX_IT.sh titlepage.txt LICENSE.txt preface.md arxiv/anc/)
