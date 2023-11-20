
# Preface

These lecture notes give an introduction to Machine Learning
(henceforth, "ML") basics that can be conveniently covered in a
one-week compact course for a target audience of participants with
some background in physics. It was first taught in June 2022
(virtually) at the Albert Einstein Institute in Potsdam, as part of
the International Max Planck Research School, and video recordings of
the lectures are available on the AEI web page. This document mostly
consists of the notebooks that were presented during the course, with
some fixes, amendments, and extensions (and this origin explains the
somewhat messed-up structure of the table-of-contents). The arXiv web
page for these lecture notes also have these notebooks as standalone
`.ipynb` interactive Python notebook documents, which interested
readers can download and study - and in case they have a `@gmail.com`
email account - hence a Google account - upload to their Google Drive
([http://drive.google.com/](http://drive.google.com/)) and then
execute as Google Colab notebooks. This approach gives a convenient
way to learn about Machine Learning without having to go through the
motions of installing any software locally - since all code will run
on a virtual machine back-end in the Google cloud that has the
relevant ML libraries installed.

Given that there are many ML tutorials available nowadays, the
question seem valid why to introduce yet another one. The two primary
reasons behind this are that, first, there are some fundamental
constructions in ML that are interesting to discuss but much easier to
explain to participants with some background on differential
equations, and second, that the big public attention focus on the
current ML megatrend can lead to overlooking major gold veins in the
mine. In particular, just as ML is benefitting a lot from the computer
gaming industry having made powerful numerics hardware very
affordable, physics can benefit a lot from not only ML itself, but
also the ML having made high-dimensional numerical optimization much
easier to handle than in the past. While it has been possible in
principle for many years to write fast gradient code even for
complicated calculations by hand (as the present author has
e.g. demonstrated back in 2008 in
[https://arxiv.org/abs/0811.1915 - The many vacua of gauged extended supergravities](https://arxiv.org/abs/0811.1915)),
pragmatically speaking, this was effectively out of reach for many
practitioners in physics due to the high time commitment required to
both master the technique and then write the actual code. A major
thesis of this course is that with ML technology available, just about
every physicist should be empowered to readily tackle many a
non-malicious numerical optimization problem in 1000-dimensional
parameter space - and the course material discusses in detail how to.

Apart from these primary reasons, there also are secondary reasons for
presenting this material in the form chosen here. One of them obviously
is to showcase the general usefulness of Jupyter notebooks (here in
their incarnation as Google Colab documents). On the educational side,
this course emphasizes the importance of forming good mental models for
basic principles and ideas, empowering the participant to correctly and
proficiently reason about behavior - to the largest extent possible.
This empowerment especially is an explicit articulated course objective
here since there is a very concerning trend in recent years for technical
documentation to move in the opposite direction and merely provide
do-this-to-use-it instructions; "the opposite of education is training".

One obvious obstacles to this important objective of always enabling the
student to correctly reason about behavior is of course limited
available time. Clearly, the course needs - for example - to contain a
quick introduction to the Python programming language, but cannot
possibly cover all the relevant detail in about a single day.

Whenever this problem arises, the course at least tries to provide
references to the authoritative documentation, which sometimes may
itself have shortcomings, but nevertheless generally provides the
best-available answers.

Another important obstacle to "enabling students to reason about
behavior" is that we generally cannot reason that well about what is
going on deep inside ML models - especially in comparison to algorithmic
code. Overall, this is not at all surprising: once we consider employing
ML to handle a problem, this typically means we already have conceded
defeat on the algorithmic front - that is, given up on the idea that we
could come up with some precise algorithmic definition that could be
inspected and proven to satisfy the expected objectives via stringent
analytical reasoning. Given that we are still discovering and learning
to understand a lot about in particular Deep Learning, we might be able
to explain some things we still struggle with these days better in the
future - but in general, we should perhaps not be too surprised to find
that trying to reason about the behavior of ML systems can run into
similar problems as trying to reason about biological systems.
