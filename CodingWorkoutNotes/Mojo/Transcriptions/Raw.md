Set of notes from YouTube transcriptions.





-----

Link: 
Date:
Title:
Transcription:

-----


-----

Link: 
Date:
Title:
Transcription:

-----


-----

Link: 
Date:
Title:
Transcription:

-----



-----

Link: 
Date: 2023.06.19
Title: [Mojo: A Supercharged Python for AI with Chris Lattner - 634](https://www.youtube.com/watch?v=-8TbsCUuwQQ)
Transcription:

Today we’re joined by Chris Lattner, Co-Founder and CEO of Modular. In our conversation with Chris, we discuss Mojo, a new programming language for AI developers. Mojo is unique in this space and simplifies things by making the entire stack accessible and understandable to people who are not compiler engineers. It also offers Python programmers the ability to make it high-performance and capable of running accelerators, making it more accessible to more people and researchers. We discuss the relationship between the Modular Engine and Mojo, the challenge of packaging Python, particularly when incorporating C code, and how Mojo aims to solve these problems to make the AI stack more dependable.

Intro
all right everyone welcome to another episode of the twimo AI podcast I am your host Sam cherrington and today I'm
joined by Chris lattner Chris is the CEO and co-founder of modular AI before we
get into today's conversation be sure to take a moment to head over to Spotify Apple podcast or your listening platform
of choice and if you enjoy the show please leave us a five-star rating in review Chris welcome to the podcast
hey Sam it's great to be here it is great to have you on the show The last time we got a chance to speak was I
think back in 2020 around this time for the the big great ml language on debate
but you've uh I think you've switched teams from a language perspective since we asked the question right
I think there's a new Contender there's a new enter it on the field how about that there's a new contender in town yes
Chriss background
and uh we will get deep into into that conversation but before we dive into
Mojo uh the new Contender that we're speaking of and we'll be speaking of and all the work that you're doing on it I'd
love to have you share a little bit about your background uh refresh our audience with you and some of the things
that you've been up to yeah sounds great so I've been uh kicking around the software industry for a number of years
now and have built and worked on a lot of different kind of low-level languages and compilers and other Technologies in
the developer tool space have a lot of fun with that and have been learning a lot and so I've I'm most well known for
open source things like the lvm compiler the Swift programming language things like this
um but I got interested in in AI in 2016. and 2016 it feels like forever ago
now but at the time I felt like all the best work had been done and it was just such a outrageous new approach to
solving buying old problems and so I just got into it deeper and deeper and deeper and good news not everything AI
has done yet so I didn't quite miss the boat but from there I went through many
different parts of the journey worked on Google tpus and tensorflow and a bunch of other things like that
um built more production systems worked on hardware and have touched many different parts of this elephant and so
at modular we're here taking um you know I bring a lot of experience with a lot of different parts of the
stack and we're trying to help lift AI to the next level and at least a part of that is in
What is Mojo
developing and promoting a new language for AI and that is Mojo can you talk a
little bit about Mojo and uh its significance yeah absolutely I mean I
think that if you if you zoom out to understand what Mojo is you have to understand where it came from and so
um when we started modular our Quest is to make it much easier to build deploy
and evolve AI research and so taking research lifting it to new levels and
then getting that research into production now this is this is a quest that many people have been on for a really long time but it's really about
making this whole technology stack more accessible and make it so more people can plan it so the experts at many
different levels of the stack don't get stuck in one level and one of the things if you zoom into something like tensorflow or zoom into something like
Pi torch you'll find is that many people work at the python level which is
fantastic and they know how to build models and things like this but researchers who want to push the boundaries end up having to work at the
C plus level and like that's one of the dark truths of python is that deep down
underneath it when you get down to things that care about performance or care about Hardware you quickly end up in CNC plus plus land but AI is even
worse than more challenge than most python systems code because now you
bring in gpus and tpus and accelerators and all this kind of stuff and so now you end up in this actually a three
world problem where you have python at the high level you have C plus plus in the the guts and then you have things
like Cuda and other accelerator languages underneath and so Mojo is a
solution to this equation right we're at modular we're building and solving and tackling a lot of these old problems in
terms of how do you get models to be expressed in a natural way how do you map it onto accelerators and different
kinds of heterogeneous fancy Hardware from the people you're coming out with and how do you make it hackable for
researchers and to do that you have to get rid of this three world problem and the stack we built is really novel in
the way it works underneath it covers is quite unique and so we needed a way to program that whole stack top to bottom
and so we needed one language that could scale and so Mojo is is kind of that right it
starts from this this requirement of let's pull together this three world problem into something that is
consistent but then we need a syntax and so when we decided okay well we have a really
interesting and cool to compiler nerd set of compiler Technologies out of the code to under the covers to enable all
these accelerators and all this uh this fancy low level heterogeneous blah blah blah all the all the technology stuff
right we need to we need to use our interface and so I was part of doing this we said well you know python is the
obvious thing right python Powers so much of AI so much of data science in general and so what we decided to do is
build Mojo into a super set of python so that first of all it feels like Python
and it's accessible and it python programmers already know Mojo but but
then we can also give python superpowers where now python can scale down and can
be high performance and can run on accelerators and can do these things that it hasn't been able to do before awesome awesome yeah to what degree it
What is Mojo built on
is the work you're doing with Mojo uh build on top of or depend on some of the
things that you've done in your past lives around llvm is that is llvm an enabler for this new uh this new tech
yeah absolutely so um there's a number of different things that modular and
Mojo build on top of and so you can say modular is a fairly young company we're about 18 months old at this point but
it's built on many years of experience building a lot of Technologies in a lot of different places and so a lot of the
research has been done in other contexts one of the pieces of that is this compiler framework called mlir mlir is
is you can kind of think of it as an evolution of lvm that has enabled a new
generation of compiler Technologies mlr is now widely utilized across the entire industry for AI accelerators and it's
been very rapidly adopted it's something that I and the team built at Google and then we open sourced and it's now part
of this lvm umbrella of Technologies llvm as you say is also a really important part of the
component stack so lvm is an umbrella project that includes things like mlir and it includes like the clang compiler
for CNC plus plus that many people know about there also includes fundamental building blocks like code generation for
an xa6 processor and things like this and so we we build directly on top of a lot of that technology as well and so
that's that's all kind of integrated into the stack and that's one of the um you know you make the hardware go
Burr kind of things and so that's that's all super important and so when you think about
The three world problem
you you kind of painted the picture of this uh uh three world problem every
time you say that I think of three body problem it's a science fiction book and Trilogy um but it's three three you
think of this three world problem and how as uh an AI developer who is trying
to um you know actually get work into production you have to kind of think really deeply in the stack is the is the
idea with Mojo that you want to make it easier to go deep in
the stack or do you want to make it uh more transparent to the user so that
they don't have to go down into stack and everything is just kind of working underneath without their kind of needing
to switch boundaries yeah so so modular we have a couple of different goals right so one goal is meet people where
they are solve today problems build a faster horse right and so and that in
that in that department nobody wants to rewrite their models they want the code to just work right and so they want new
capabilities but they want to fit within their existing ecosystem now when you deploy a model this is
something that I think many AI practitioners don't talk about quite as much or maybe
they the practitioners and the researchers don't have coffee enough because we're pretty well understood how
to train a model deploying a model is another completely different set of problems and so you know you can you can
take this in many different ways one example of that is that python is great for research it's maybe not the best for
production deployment at scale and so many teams will end up rewriting their entire model in C plus plus just to get
it to go if it's if it's a dynamic model for example language model now that and
there's a bunch of interesting work and there's a really smart people that do that kind of stuff but why is it that we
have to write our production model or our research models to get them into production that's really unfortunate right and so we'd like things to just
scale and so one of the things that Mojo does is it's way faster right and and also if you use it the
right way you can also make it so it deploys without you know into a single 8.0 executable and things like this and
so it has new capabilities that the python natively doesn't provide which enables it to go much further and so
useful that way now another piece of it is we're building really high tech
you know what we call the engine that powers Ai and we have the fastest inference engine that's unified across
tensorflow and pytorch now right and that engine is built entirely on top of
Mojo and so it's not just about building a faster horse and like enabling the
existing use cases it's about like unlocking this potential of this next Generation hardware and to us like
that's equally important even though many people see mojo as being um you know it helps helps out Python
and that's you can look at it as moving python forward but really where Mojo
came from is working backwards from the speed of light of hardware and so you know we talk about Mojo can
be up to 35 000 times faster than python uh that's because it's at the limit of what
the hardware can achieve and Mojo some people will see it as it looks like a faster python or a python that has no
Gill or a python that types enable performance or you know things like this but but it's really about what can the
hardware do how do we unlock the full potential and how do we do that in a way that python programmers have direct access to but you said uh python that
Python vs Mojo
has no Gill that's like uh The Interpreter lock or something like that and it is one of many limitations that
inhibits the performance of native python yeah yeah so um I mean I think that if you zoom into python right and I
don't I don't know how deep you are in the internals of python a lot of folks use Python but they don't dig into it
like like I do um and so don't dig into it like you do no yes
I think you're you're in the majority um and so uh folks that use Python know that it's maybe slow it doesn't scale
super Well it can't use all the processors on your machine without a lot of work around and things like this
there's many aspects of the technology within the python implementation that
make that so and so it has an interpreter right interpreters are slower than compilers generally it has
what's called the Gill the Gill prevents effective use of multiple cores the
implementation within python puts all of the objects on the Heap in a very
specific way and there's a bunch of implementation details that go into how it works um Mojo is I mean interesting in
different ways first of all it's compiled second of all it gets rid of the global interpreter log
third it changes this representation fourth it adds types like you can keep layering in all the different all the
differences here um but the consequences that it really is a it's a different animal it has
different characteristics than what python the python implementation uh provides and so because it's a first
principles programming language right it really has addressed a lot of the problems that python users have felt as
symptoms but have not dug into you know Wise python this way you mentioned that
Mojo vs TypeScript
it adds types you know one of the biggest things that's happened on the JavaScript side of things is the
emergence of typescript um as being kind of this uh JavaScript
compatible language but that is strongly typed is Mojo does mojo have that same
kind of relationship to python yeah there's a there's a bunch of very um good analogies there so typescript
super popular a lot of people use it um and it fits right into the the JavaScript ecosystem and so Mojo uh has
a similar relationship to python where it's a superset it works with the existing ecosystem all the packages in
Python just work in Mojo which is really important to us and so we don't want to break the python Community uh many many
folks went through the python 2 to Python 3 transition it was really uh quite difficult in various ways and so
we don't want we don't want to relive that right um and so uh and so you can look at mojo
as a python superset and so by doing so you can pull pull forward all of the existing code and all that that
ecosystem into a module world there's a big difference though and so um actually if you zoom into Python 3 as
it is today python allows you to add types and those types if you add them to your
code are there for some linter tools or Checker tools that can identify bugs and
can identify you know obvious mistakes in your code sometimes but those types in Python aren't used and can't be used
by the implementation for runtime exactly and so because of that you can
detect certain errors but you don't get good performance out of that and so what Mojo does is it kind of takes that next
step and so you can use the existing you know you can use lowercase i to say it's an INT you know and declared as an
integer that way or you can use capital I and if you say it's capital I that's a Mojo strongly typed integer and it's
checked and required and then it also is used for performance and you know we see
you get 10x 20x faster performance if you just add a few type annotations and we have a couple of demos of that
Advantages of Mojo
carrying forward that typescript analogy what I've appreciated about it is like
well a couple of things one um
you can you can add types without like fully buying into all of typescript and
needing to know all that but still get like a little bit of benefit without going all the way into kind of this new
paradigm uh and also when you are looking at code that you're not familiar
with that is kind of fully adopting the new paradigm it's still familiar like you can kind of make your way through it
knowing that there's things that you don't know uh if you're if Mojo enables kind of that same level
of flexibility um I would think that's a good thing yeah well so you come back to this two
world problem or the three world problem right where you have Python and python lives on top of C plus plus so being a
superset means everything you do in Python Works in Mojo right so obviously types cannot be
required because python doesn't require types right and so so that's also that's all
true but in the traditional world of python if you run into performance problems or you need access to system
software or low level things you have to go build a hybrid package whereas half C or C plus plus half python and so the
value prop that Mojo provides is you can continue writing Dynamic dynamically typed code that's all good but instead
of switching to a different language to do high performance lower level things just as you say you add a few type
annotations right or you use some lower level syntax within your existing code and then you
can you know put more effort in to get more performance instead of um you know having to switch to a
completely different language where the debugger no longer works on both sides and you know all these things got it got
it you mentioned that Mojo like gives python superpowers like
Superpowers of Mojo
um that made me think of I I may I'm probably not alone in this that you know
the first place I've learned about like this Dunder the dunder uh functions in Python was from Jeremy Howard and the
fast AI course like there's probably a lot of folks listening who came across it in the same way uh
are you accessing these superpowers through like python native structures
like that or are they annotations or like how do you well first of all what
are beyond the ability to kind of kind of tap into lower level structures like
what are some of the kind of superpowers or enhancements that Mojo adds and then
how are they accessed yeah so I mean you mentioned Jeremy Jeremy's been a huge influence on me personally I mean you
could say you can go back to saying like why does mojo exist and a lot of that's Jeremy's fault just just between us
right and he's been he's been pushing for years specifically for hackability
research ability like Jeremy's Jeremy's got the unique kind of brain where like ever like the whole problem fits in his
head and so he can understand all the different parts of the problem right and so so yeah so Mojo has all the dunder
methods and so if you want to add you know you want to make the plus operator work you can implement the underground ad method and things like that but then
it goes a little bit further and so if you look in the space of system programming languages you enter you
enter the realm of things like rust and C plus plus and like these kinds of languages right and the systems
programming world for a long time has been pushing towards bringing safety into this world so C C plus plus you
have a pointer pointer dangles bad things happen your app crashes you have security problems all these kinds of
things rust and Swift and other languages like that have gone further into making uh make it possible to get
good performance without sacrificing uh safety and so we've brought a lot of those
ideas directly into Mojo and so in Rusk there's a notion of lifetimes and ownership and these kinds of things that
enable safe pointer usage and things like that so Mojo brings that in now these are features that you know
obviously you don't have to use unless you're writing low-level code and you care about getting a high performance in
certain use cases but having that available gives you a
very accessible whole stack solution that allows you to go all the way down and get rust style performance out of a
CPU and um and similarly like we talk about this Hardware stuff well at the bottom even
on a CPU you have many cores you have these crazy Vector units and Matrix extensions and like it's really
interesting to see the evolution of Hardware because if you go back 10 years ago it used to be that there was a CPU thing and a GPU
thing and these were points in the space that were very different and they were completely unrelated from a hardware
perspective but today that whole line has gotten blurrier because gpus have gotten more programmable CPUs are
getting more AI stuff in them the CPUs these days have B flow 16 and like all
these other AI things that are being built right in and so we're getting a spectrum of programmability and so a lot
of what Mojo is about is unlocking that for people and making it accessible and making it so that again you don't have
to switch languages just to just to get access to this stuff you know that you're rightly focusing on CPUs and gpus
but there's uh you know as you know a wide variety of other options and
perspectives tpus and other um you know more
um you know other kind of newer newer and more specific more exotic that's a
great word yeah exactly approaches to this do you are you building mojos such that
you know it is anticipating all of these options or is you know when you you're focusing on making mojo better use
acceleration are you really talking about you know gpus or maybe gpus and tpus uh well so um so I I spent a couple
of years working on Google tpus and Google tpus are uh I mean they're they're an impressive set of Technology
machines because they scale up to exit flops of compute they're highly specialized for AI workloads they're
also internally really weird and so to plus one exactly what you're
saying right AI isn't just about like a GPU right I mean so much so much
thinking around AI technology is okay I just need to get the gpus lit up and then go but uh particularly if you start
deploying well if you rang on a smart camera or something the AI Chip is going to be completely specific to that camera
right if you're doing uh you know Google scale training on on crazy distributed
machines like that that's that that Hardware is quite different and so um this is where one of the things that's I
think very exciting to me as a technologist about Mojo is that it's built on this mlir compiler
so mlir is again the thing that we built started started back at Google now it's
being used by basically the who's who of all the hardware industry and mor talks to all of these things and so
um if you uh if you're familiar with llvm lvm as is is now a 20 year old
technology it's widely adopted and talks to all the CPUs and some of the gpus but
uh llvm has never been successful at targeting AI accelerators and video
optimization engines and like all the other weird Hardware that exists in the world and that's the role that mlr
provides and so Mojo one of the ways that it's implemented is it fully exposes that power
and brings mlar compiler uh you know all the nerdery that goes into the compilers
and it exposes up to library Developers and so it's actually quite important
that you can talk to for example tpus or other things like that in their native language which in the case of a TPU is
this like 120 by 128 tile and being able to expose that out into the language is really quite important
so anyways that's that's a long way of saying yes it is more than CPUs and gpus though CPUs and gpus are the starting
point obviously for lots of really good reasons but we've built this thing to have really long legs that can bring us
into the future and do you see it extending
Modular AI Engine
um to things that are even more exotic like your graph cores and samanovas and
like the you know things that take a very different approach to um the underlying compute yeah so so
Mojo's really so let me bring you back to where modular is coming at this because Mojo is one of the components of
the air stack as a way to look at it so modular is building what we called a unified AI engine and so this unified AI
engine what the heck is that well it's an engine it's it's an engine it's not a
framework and so people are familiar with pytorch and tensorflow and these machine learning Frameworks that provide
provide apis and so you get and then module and the apis that we're all familiar with underneath the covers
there's a whole bunch of deep technology for getting things done to a GPU getting things onto a CPU and so pytorch 2 just
came out with this torch Dynamo stuff and like all these all these exotic low level technologies that make the
hardware work on gpus Cuda is a major component of the technology stack that
everybody Builds on top of right and so our engine fits at that level of the stack and the the cool thing about it
particularly when you're deploying is that it talks to lots of hardware it also talks to both Frameworks and so
when you're taking a model from research for example you have a nice pie torch model you get off hugging phase we have lots of people do this of course
um you want to deploy this thing well you don't actually want all of Pi torch in a production Docker container
what you want is a low dependency efficient way to serve
the model and so that process of getting from pytorch and into a deployment thing
is what the modular technology stack can help with now as you say coming back to answer your question graph core some
Nova all these all these Hardwares can't talk about any relationships
that's not but the um but from a technology perspective they're they're
all slightly different in high level ways so some anova's chip is
from my understanding a what's called a cgra right which is a super parallel
really crazy thing that has almost nothing to do with CPUs graph scores are apparently lots lots of
things that look like CPUs but they their memories are all really weird and different the way they communicate is very structured right and we all know
CPUs and gpus right um and so uh what our technology stack enables is if
you're the samanova or cerebris is another example of a really crazy system uh like
those people need to implement a compiler for their chip right and so they're the experts on their ship they understand how this
works and what modular can do is provide a thing for them to plug into so that they get all of tensorflow and pytorch
and one of the major problems we have today with with Hardware accelerators particularly ones that are not the
dominant player in the space is that their tools don't actually just work
right so often um I'll pick on Apple for example right so apple has a deployment technology
called core ml is talks to the neural accelerators and
they have all this amazing Hardware on a Mac or an iPhone but cormel is not actually compatible with all the models
and so getting something onto an Apple device means fighting with this translator and trying to get it to not
crash and you know doing all these things the the production World struggles with and you know if I I talk
with many people many leaders at software companies that are building AI into their products and a lot of
software leaders uh you know they they see the symptoms they see okay it takes three months to get a model into
production right they they see symptoms like I need a team of 40 people to be able to deploy
things and they're very expensive very specialized people why is it this hurt right right and the answer to those
questions are the the tools the Technologies are not anywhere near the tools and Technologies used for training
and so there's so much suffering so much from so many problems in these things and and the root cause is the technology
I've been working on for years which is um for any one of these chips people have had to build an entire technology
stack from the bottom up and there's very little code reuse across across Hardware
and Hardware vendors again I'll pick on Apple but I love Apple also it's not
it's not out of anger it's that you know it's very difficult to track the speed of AI itorch moves super fast right this
is stuff that you need a very dedicated team you need to be super responsive you need to be on top of this stuff and also
uh the compiler problems and the technology problems to make the hardware work are really difficult and so
um there have been a lot of really smart people working on this but if you're always focused on getting the next ship out the door and you can't take a step
back and look at this whole technology stack then you can't make the leap that modular has is driving forward
interesting interesting so you said something earlier kind of describing the
Replacing Cuda
the engine and its place and it made me think of uh
you know fur for ages now right um we've kind of you know decry the kind of
Stranglehold if you will put a negative spinner the Cuda has on like the low-level programming interface which
basically kind of keeps you know ensures that Nvidia has you know long lasting
position and makes it very difficult for you know say an Intel to come out with uh
um you know a CPU with some numeric capabilities and displace it because there's all this you know hey there's
all this code that's been written in these three worlds that you've mentioned and like it's not as easy as just
swapping out the hardware right are you envisioning that this this modular
engine is this kind of replacement for Cuda that is multi you know Hardware
capable is that the the core idea yes I mean that's that's one of the value props we provide so um if I zoom out and
look at the steps the end history has been going through so um we are we as an AI industry owe a
huge debt of gratitude to Cuda like go you go back to the Alex net
moment for example right A lot of people talk about it was a Confluence of imagenet and the data sets and things
like this it was a Confluence of hardware and the fact that gpus enabled an amount of compute that could cause
Alex net to happen but a lot of folks forget that Kudo was what enabled some
researchers to go write convolution kernels and actually get a machine learning model running on a GPU which
the hardware is definitely not designed for back in the day right today's yeah it's taken over and it's a little
bit different but back in the day that initial breakthrough was really in in you know a large part thanks to Cuda and
so one of the things that's happened is that as um AI has taken over right a lot of
technology has been built on top of Cuda and it's it's a very good thing and it's very powerful and flexible and hackable
and it's great but as you say it's kind of put us into a mode where one vendor has this dominant position and it's very
difficult to um you know if you're a hardware vendor at even an AMD or some other widely
known company that has really impressive Hardware to be able to play in this ecosystem now what what's happened and
one of the things that led into the thinking that went to modular existing is that there have
been a lot of compiler technologies that have been built for example there's this xla compiler that I worked on at Google
there are new compilers every day being announced by different companies where they're saying I will build a compiler
that will make ml go fast for example on gpus um and so several years of work lots of
cool technology lots of examples of these systems exist like and the names keep changing but the technology is very
powerful the problem with that is that they have lost one of the things that made Kuda really powerful which is the
programmability and so what what has happened is the compiler nerds which I'm a member so I
can I love the compiler nerds but those compiler nerds have went and turned AI
code generation and things like this into a compiler problem but that has excluded all the non-compiler people
right and so if you look at tpus for example tpus have uh can express
everything you can do in this xla compiler and so I can do Matrix multiplications convolutions element
wise ads Etc et cetera et cetera but it can't do sparse operations can't do data
operations can't do pre-processing and so um AI you're an expert you know this AI
is not just about matrix multiplication it's about data loading pre-processing this full parallel compute problem that
is part of AI and so what has been lost over the several years of trying to
solve uh the Cuda lock-in problem is that people have tried to make this compiler problem and now you've turned
into a different lock-in but instead of locking into Hardware you're locking uh most smart people out of the ecosystem
and these compilers haven't been super successful at being compatible with code and things like this right and so what
modular is doing is we're saying okay again I love all these people I've been working on this stuff for a long time
myself but what we're doing is saying start from a different perspective what is our assumption our assumption is
people don't want to rewrite their code what that means is you have to have all the operators all the systems that go
into something like tensorflow or pytorch need to work okay
well that's a thousands of operators each and this really messy job but we handle that job for for the world right
the other thing we say is okay pytorch is really popular in research tensorflow is still quite popular in production
what what we see out in the industry again every shop is a little bit different but a lot of people have both
tensorflow and Pi George and so they don't want to have this bifurcated stack built on top of these
things they want to actually have one system that they can scale out and so we make our problem even more complicated
by building a unified solution and so now it's not about 2 000 on the tensorflow side 2000 on the pi torch
side it's about four thousand right and it's actually even worse than that when you bring in some of the other
Technologies but now you talk about Hardware right it's not just about Intel
CPUs and Nvidia gpus it's this other axis that then does a multiplication
to this whole problem and says okay well now I have many different there's probably a hundred or a thousand different kinds of hardware and so where
traditional teams have built a point solution saying okay I'm going to build a fancy compilery thing for one hardware
for one framework and you know in one One Direction along this and they built one of these uh
I mean you often very good tools but they're very purpose built in one case you know we're having sympathy for all
the software people that have to deploy because software people they don't have one piece of Hardware they don't have
one model they don't have one framework they don't have one product right their products evolve over the course of
decades sometimes and software lives a long time and so they need to be able to talk to lots of different generations of
this stuff so a modular what we've done is we've said okay well this is suddenly a very different problem for a
technology perspective than building a point solution and this this problem this I need to
solve this massively complicated space where you have Hardware on one side you have the sheer scope of AI on the other
space is what drove Mojo to exist because we need a way to make this
entire stack accessible hackable uh understandable to people that are not
themselves compiler Engineers we need people that know really fancy numerics and sparse algorithms and you know
convolutions and or people that know their Hardware we need to know like all these people that are involved in all of
this massive technology stack that we've been building to be able to collaborate and work together and build cool stuff
at a high velocity right and that's where we think that Mojo is really interesting because as far as I know
nobody's done that like I mean it's like a completely unique Creation in the space and um and we hope that will
really simplify the world one of the things you know I uh we kind of joke about it but you know our biggest enemy
you know the mortal enemy that we struggle with a modular is is actually just complexity
right and the in the AI space there are so many systems so many Technologies so many uh you know layers of stuff that
has been built up and you know if you zoom out coming back to you know 2016 I
thought I was you know too late to do anything important in AI like what you realize is that AI is still not done
right this the stack that we're building on is adolescent like it's it's in its teenage years and so what we need is we
need to get to that next level where everything actually works is way more predictable it's actually hackable when
you try and experiment as a researcher the tools don't break out from underneath you and when you achieve that we think that the the impact of AI can
go much further and that many more people can participate when you when you talk about the the complexity and
Packaging
the diversity of underlying components and then you talk about kind of how the
lifespan of software kind of extends over generations of underlying
infrastructure it makes me think of uh like dependencies and dependency management
and packaging and all these things as like huge problems that need to be solved is does that play into what
you're doing at all uh also not directly but that your your pattern matching your
neural net there is doing a very good job of pattern matching and seeing seeing what we're talking about here um the the packaging problem is often
because you have all these incompatible systems that are lashed together and so if you zoom into python packaging I mean
there's there's a lot of things going on there I'm not an expert in Python packaging people I talk to that are
um a big part of that is because of the C parts of these python packages
right so you pick our old friend numpy for example right numpy has a ton of C code inside of it as well as the python
API well packaging that means you're not actually packaging python you're packaging C code C's never had a package
manager that's any good right and so and so you know it's it's funny you look at
these old problems we've been struggling with well you get rid of the C code and suddenly packaging is way simpler
right and so this is one of the things that Mojo provides is providing unified language and more generally every time
you see one of these fissures like you're talking about the hardware divide you know here we're talking about python
C plus plus you talk about Cuda versus sickle versus hip versus like all these other crazy things that exist in the
world like each one of these things is at the bottom of our stack driving complexity up
and so at the end of the day you know you'll have a researcher who very reasonably says hey I just want to run
this model on AMD GPU no big deal right should flip a switch right but the problem is is that at the very bottom
all this stuff is very different and all the cracks go up and you know it's if you take reliability and it's 90
reliable and then the next step is 90 reliable next step is 90 reliable you start multiplying together all the point
nines and you get something that's ten percent reliable right and this is this is this is the AI stack that we all
depend on and you've got you've got you know this easy problem which is well
The AI Stack
okay let me be careful here you've got this one class of problems that is
very challenging but it's easy to deal with and that is when you're trying to
use all this stuff together and it just doesn't work like it doesn't compile it doesn't run or whatever but then you have this other problem where
it works but you don't know that it's actually not working because of like
semantic differences or you know what have you um it's either not performing well or
you know your results are are you know you're not converging your results are out of whack and like you're digging
deep into underlying libraries trying to figure out like why are your answers like crazy yeah I give you one example
right I mean just go through the life cycle of deploying a model right so to just you know make up a scenario but um
but to just double click on what you're saying okay I want to deploy a model well now I need to get it to go through
coramel or one of the many things for deploying to some piece of Hardware results don't work well now to just like
100 like just it's just like a plus one you 100 times now you need to know not
just pytorch not just your model not just core ml but also the translator also all these things and you dig in and
dig into dig and you find out it's handling the edge padding on a convolution slightly differently right
it's like and so now wait a second so like all of these tools were supposed to
be making it easy but because they don't they're not all reliable like it's a sleeky abstraction now you have to
understand all of this complexity right and so this is this is what causes it to take three months to deploy a model
right fundamentally this is something where you know I think that many folks that are building AI products and
they're managing you know they're the VP of software some technology company right they just see
the symptom of why does it take so long to get this model in production but they don't realize that the tool set this
this fundamental technology that all this stuff is built on top of it's not up to the standards of a software tool
set it's not you know no C programmer would tolerate AI Tools in their quality
you know it's just crazy but but again this is just the maturity of the AI technology space and by solving that
problem you know what we want to see is like way more people way more Technology Way way more inclusion in the kinds of
companies that are able to work with AI and do things and we think that'll be a really big impact on the world
Business Model
so we've talked about Mojo we've talked about the this inference engine
um or the engine that we've referred to in the context of Mojo you've talked
about like 35 000 you know X performance and improvements over a standard python
I do need the engine to get that level of um of
uh performance Improvement you know it is switching using Mojo like lock you
into using this engine like what's the business model there are you do you have licensing issue like it's both you know
I have a bunch of questions kind of coming out here and they span kind of Technical and like business licensing
kinds of questions how does all that work great question so you've identified the right the right
players there's Mojo which is a programming language it's a programming language that's a member of the Python family it's really
useful on for example just CPUs which is the only place that python plays and so
many people see mojo as just being a better python now we have the engine the engine itself
can stand alone and you can use the engine as a drop in replacement works with tensorflow pytorch it'll make your
burp models go 3x and you're using it as a drop in replacement for what exactly for a traditional tensorflow
implementation so actually before I before I answer your bigger question let me dive into
that so what the modular engine does is you replace the tensorflow with our
tensorflow or your pie torch with our pytorch or if you use in torch script or things like this and so you just put in
and put a new thing in your Docker container and and what you get from that
is massively better performance and so you know tensorflow is quite good at production but we're showing three to
five x better performance on for example an Intel CPU or an AMD CPU or an
arm-based graviton server in AWS and so you think about that and you see three
to five x better performance well that's a massive cost savings
exactly that is a massive cost savings well and it's also a massive latency
Improvement and so many of our customers love that because then they can turn around and make their models bigger right and so now you can have a better
product for your customers and so you get you know direct impact on your costs
direct impact on your product and this is a huge deal for people and again this is where you know I'm a technology nerd
sometimes right and I love some of the how it's built but the impact on products is is phenomenal and that the
engine is a really big deal for for just like getting production AI to scale okay
Commitments
so just kind of continuing down on that line before we click back out then I
would imagine one of the commitments that you need to be making to folks that are thinking about using this thing is
how close you're going to stay to the you know the development of that stack
right yep yep absolutely well so I mean one of the things also that um you know our customers love is that
Google and meta don't actually like support tensorflow or Pi torch
right these these people forget but these are not products right these are open source
projects they are Hobbies maybe for the the mega Corps and so you're essentially
offering like a supported opt performance optimize version of
tensorflow and pytorch right but then to if I'm going to think about using
this I need to know that I'm not going to get left behind like you're gonna you know I'm gonna wake up one day and I'm three versions behind the latest thing
in tensorflow and it has something that I need in order to make my you know
you know 500 trillion parameter llm work yep yep so I mean we're committed to
doing that so I don't know if this is like a binary question but yes we do that um but the the thing that if you you
know the Enterprises we talk to that care about their costs right um often they want somebody that they
can call right and if if you think about it right it's it's analogous to who
wants to run a mail server themselves right you can run send mail or something right but nobody in the right mind does
that right why do we do this with AI infrastructure it's because there's no choice there's been nobody to reach out
to nobody that actually can't do this and the thing that I think many folks forget is that meta and Google they've
their technology platform has diverse a lot from what the rest of the industry uses right so they both have their own chips
they build right for example right and they have their own specific use cases and so they're not actually focused on
making the traditional uh CPUs gpus and public Cloud use case actually really
good that's one of the reasons why we have such high value we can deliver um and so so yes we are we are a
this is a product for us that means we actually support it that means we invest a huge amount of energy into it this is
one of the reasons why we have such phenomenal results as well so yeah
to your other question like one of the great things about being a drop in replacement is that from a customer
perspective at least is that it means you can undrop in like you can use our
technology and if you want to switch back you can always switch back at any time at some point we'll make it back to that broader question but I'm thinking
Compatibility
about like you know we've talked about uh moja's being this better python
um but you know what makes python usable and AI is not just kind of the core
python it's all these other things numpy and and pandas and many other packages
you mentioned you know we know they have C at the heart of them so at some point
there's a significant number of packages that you also have to kind of rewrite
that need to be Mojo native I would think in order to get the full
uh the full performance yeah so um let's dive into compatibility so uh Mojo's
still a young language we haven't talked about that but it's still not it's not done and I think it will take another year or so of development before it gets
to be um like solving all the world's problems that we want to solve things like this right but even today you can import and
use arbitrary packages like numpy pandas tensorflow pie torch whatever directly into Mojo and so a really important part
of how our stack works is you don't have to rewrite all of your report or touch
all of your python packages I mean many people have their own python code it's not just big packages like numpy
right and so and so Mojo talks directly to all those packages you don't have to write wrappers it all just works right
and this is this is a really big piece of that now if you choose to move your code into the Mojo Universe then you can
get the benefits the Mojo provides and so if you're just talking to an existing package well it'll still run python
speed it will be fully compatible and but it will also run with the same implementation this default python
implementation and so moving your code to Mojo can then unlock these new capabilities but then you can
choose to do that a package at a time or however you'd like to do that and so that understood
in order to I guess I'm curious like how much of the like surface area of AI related
packaging have you built or am I thinking about this the
right way like in order to fully uh provide the performance benefits that
you're talking about did you need to you know Port numpy over to you know kind of
a Mojo native or to run on mli or whatever at whatever level that makes
sense did you you know um pandas all these other like how much did you need to do and how much of that
is done like percentage-wise relative to what you expect will need to be done to
be absolutely uh well so the answer is zero so our our
solution is like our solution enables to talk to the entire python ecosystem out
of the box so matplot website sci-fi numpy like all
that stuff just works right and and that again come back to being pragmatic and productive like we can't
uh I'll make fun of you and I'll make fun of me from our last call on the you know like great language debate right
the the the the problem with any new programming language is a new programming language has no community
has no package ecosystem right and so that that again like uh myself on that
previous call and all the other lovely people there right you want to get ml out of python for whatever reasons is is
very exciting but it's not very pragmatic because the entire data science ecosystems all wrapped around
python this one's also pretty great right I mean I think that that's something that
um you know people in other communities like to make fun of python because of indentation or whatever it is but python
is beautiful right subjectively I will say it's my opinion but and so what Mojo
does is enables you to use literally everything in the python ecosystem and then if you want to invest more
effort to get more performance then you can do that but you don't have to right and this this is this is the major value
prop now in the case of modular and why we built Mojo our like business objective is go make
ml really awesome right and we want we we care about the Matrix multiplications
and the convolutions and the like the core operations that people spend all their time on in Ai and so we wrote We
rewrote all of that stuff in Mojo and so this isn't like rewriting that plot live this is like rewriting Intel mko
equivalent right or rewriting the Cuda implementation of these Cuda kernels equivalent right and so that's where
we've put our energy into because that's what enables unlocking of the hardware enables unlocking of performance enables
unlocking of usability and so you know we have really exotic fancy compilerary
features that enable kernel Fusion automatic kernel fusion and things like this that you know no no normal ml
researchers should ever have to know about they just see okay it runs 10x faster in this use case well that's
pretty cool right and another thing that I think that folks are struggling with is that
you know um uh take Transformers for example I mean you know Transformers I know Transformers we all love
Transformers they're eating the world um but one of the problems with this is that because they can't became so so
important to so many different use cases we got all these very hyper specialized
software stacks for Transformers and so these existed the low levels so
Nvidia for example has a set of kernels called faster Transformer these are at
the high levels and so there's always distribution Frameworks for Transformers and things like this and so you get this very Transformer specialized stack which
again forces you into this very narrow view of what a Transformer is and it works for the Benchmark but if you're a
researcher you want to go push the boundaries and try slightly different Transformers or you know maybe there's a
thing Beyond Transformers like I hear that rnns are coming back in and you
know maybe ffts will have have their day right I mean there's like all these different theories and if we can't
enable people to do that research like we may be missing out on that next big step and so
um this the specialization that's inherent in um you know things becoming important really Cuts against generality
and so that's that's one of the things that we've seen and we that we really want to like again like if you
dramatically reduce complexity of these Stacks you can make it way more hackable and that we believe will enable people
to invent new things yeah but I want to push on this one more time just to make
Python vs Numpy
sure see if I can figure out what um expose any uh kind of fissures in my
understanding here is is what you're saying that
um or is it the case that you know when in thinking about the relationship
between like uh numpy or pandas and and python that
those libraries that you know we all use as part of
um you know that are kind of ubiquitous and from a machine learning perspective is it I can imagine a couple of things
you know one that um like they're sitting on top of the
underlying they delegate enough of what they're doing to the underlying python that you kind of replacing fixing that
underlying python gives you you know some percent of the performance benefit
um such that you don't need to deal with the upper piece
who who is you here right so are you are you asking how it works internally are you asking how a user uses it or are you
asking when somebody should do something which piece which piece of this elephant are you touching
I you know I'm both try I'm primarily trying to
make sure that I understand how it is that you're able to offer
the performance improvements that you're boasting without needing to touch any of the
libraries that people depend on and so I'm kind of asking about internals but
also like how they're used so I'm imagining like several scenarios a
you know for whatever reason yeah well a is like your 35 000 number
that is you know that's kind of a made-up number that uh doesn't actually
rely on any external dependencies and it's kind of a useless performance boasting metric that's one possibility
another possibility is um numpy delegate you know these libraries
delegate enough of their operations to the underlying python that you can get the you know significant performance
gains even without touching those things and hey if somebody did touch those things maybe it would be 70 000 or
whatever yeah I can break it down for you if you want got it okay all right so so let me let me break it into a couple
of categories so one is you have unmodified python that is just imported
so you take matplotlib just click on something that's not performance sensitive uh there's no reason to
rewrite matplotlib it's it's fine right and so you just import it if you import
it the way that runs is that runs with the existing C python interpreter and
Mojo talks to the C python interpreter and so that code runs 100 compatibility
everything just works great and like this is why the entire ecosystem works but it's no faster okay and so you're
really what you're getting as you're getting at what are my trade-offs what are the levers I'm pulling here and so full compatibility but no performance
benefit those things go together right another another another thing you can do
and so if you so um if you go to modular.com you can see our video and you can see Jeremy giving a demo Jeremy
Howard giving a demo and um and there we can see is you say okay I just take some python code I put it into Mojo
and now it runs you know it depends on the code but you know roughly 10x faster out of the box
maybe 15x 16x I mean there's more we can do to push it further we just haven't focused on that and that's running same
code but in Mojo and the reason you get performance is it's a bet it's compiled instead of interpreted it has a new
fancy compiler stack all the stuff under the covers but it's still running fully Dynamic typed code
it's just running dynamically type code in a better way and so you can get you know 10x out of the box that's pretty
good I mean that's that's quite nice then you start layering in and saying Hey I want to add types okay well now
you're talking about like changing the the in-memory representation that's going to be way more efficient well
that's 10x now you say it give me threads okay well that's 10x okay now I want to use vectors and do Hardware
that's another 10x and so if you stack all these things up this is where you
get into 35 000 times and to I will I will I will agree with you by the way
that the 35 000 number is a Cherry Picked number this is this is a an
extreme result on mandelbrot right which is a simple algorithm we can explain and people can play with in a notebook and
stuff like this but we have lots of people just you know random people on the internet using Mojo that are getting hundreds and thousands of times speed
UPS and so and so the 35 000 may be Cherry Picked but
reasonably expecting getting over 100x is 100x is pretty big like that that I
consider that to be a pretty big deal right and and and you can look at that as 100x over python or you can look at
that as saying Python's now 100x more relevant for keeping me out of C
right and that that's both of those sides of that is really cool now anyway so coming back to your categories and
then it was it was I mean at that third category um or that's it maybe it's more a
scenario than any category it is also um
I think largely the case but maybe you can like validate this for me like
you're probably using a lot more of these libraries when you're doing like Eda and kind of like the early stages of
like building a model but then you finally have your model and you know the form of a graph and tensorflow or Pi
torch and you know at that point like the things that you're relying on are kind of much
lower level as opposed to like your pandas and your uh scipod all this kind
of stuff and so you're like your exposure or your need to pull
in all these libraries at the kind of the point where you're in Vogue like you
know kind of core training Loop or inference is less yeah you want to like deploy the model yeah well exactly and
so and so if you so if you zoom into the third part let's just call because the
things we just talked about are actually completely generic software engineering things right we talked about using
arbitrary python package off the shelf we talked about take python code arbitrary python code in an arbitrary
domain and just make it go fast right it's fun right but it's has nothing to
do with AI now let's talk about AI right and so AI third category super important
turns out many of your readers or your Watchers what what want to think about AI right and so AI
is this really fascinating technology stack that yeah you talk to it in Python but underneath the covers you have
kernel fusing graph compilers and all this in accelerators and like all this
other cool stuff right and so this is where the modular engine comes in right and Mojo Mojo is an
implementation detail on the modular engine um and Mojo makes it all super extensible and hackable but this
technology space actually really has nothing very little to do with syntax or with a programming language it's a
completely different technology stack that's much more similar to like these xla compilers and the the uh you know
the internals of Cuda and or the internals of Intel mkl or you know these kinds of things so so these are all
different but come come back to your basic question several layers up in the stack which is
what is the relationship between Mojo and the modular engine right because that's also uh really important so the
modular engine is really focused around high performance production deployment go solve problems in Ai and so it's an
AI thing mojo as a language is actually a new member of the Python family
right and so for modular we see the engine as being a product and we see mojo as a technology and both of these
things stand alone so you can use mojo as just a better python if that's what you want to do or you can use the
modular engine as it drops into tensorflow and pytorch and then you just have a better tensorflow and a better
way to deploy your models but there's a much bigger and I hopefully I believe much
more important in the long term You Know Better Together story here right because putting a custom op into
tensorflow or pytorch is very difficult you know we talk about
um you know the three layer problem right the python C plus plus Cuda well
if you want to put a custom Cuda up into pie torch you have to write C plus cudas
like a C plus plus thing right but it's a C plus plus thing that doesn't have a debugger it's a C plus plus thing with a
whole bunch of weird constraints where you might wedge your GPU right and and like that that complexity makes it so
people don't do the kind of research that they might otherwise do and obviously if you have to hack C plus plus or even if you just have to rebuild
tensorflow like who in the right mind knows how to do that you know I I know these people and I love these people
right but but this is this is just monstrous right and so the better together here is that if you're an AI
person You're Building deploying models you're training you're doing research well with Mojo inside the modular engine allows
you to do is make this whole thing hackable so you can Define custom Ops so you can get kernel Fusion so you can get
all this stuff for free and then when you want to go push boundaries you can go crack open the box and say okay I'm
going to write a a custom sparse thingy for my domain or a custom summary
function that does some fancy domain specific reduction before I send all the data
across the wire and making that possible is is I think really cool interesting
yeah I I feel like we've covered a lot and there's still a lot to cover and particularly in this dimension of
hackability um but we don't have time to cover all that uh to to kind of wrap things up I'd
love to have you maybe riff a little bit on like future directions roadmap like
what are the the big things that you need to attack next to kind of build out
this Vision absolutely so um modular just came out of stealth and so we have a nice video on our website at
modular.com if you haven't seen it um there's a whole bunch of new drops
that will be adding to the product over the coming months and so you can sign for a newsletter on that the thing I'll
say is that Mojo is still quite early and so it's still it's not like ready for production use as a general drop-in
python replacement but we have an amazing community of people already coming together and we're developing it in the open and so this is this is I
think a pretty big deal for something that I hope will be important to a wide range of different use cases I mean
python goes everywhere right and so um and so I think it's really important that we as a community build and do this
together and modular's obviously driving this because it's really important to us like but we don't have all the smart people in the world and so I'd really
love for people to join us on our Discord forum and other places where we can interact and and build this together
awesome awesome you mentioned that Jeremy was a big inspiration I'm glad he
wasn't able to inspire you to write it around Pearl
again he's he he's an incredible person so he gives a killer demo in our uh a
launch showing how to take matrix multiplication and he doesn't get it's 35 000 times but it's you know 20 000
times or something in a notebook which is pretty cool so it's yeah so he's he's
an incredible person like don't under I just don't underestimate Jeremy absolutely absolutely well Chris thanks
so much for getting us up to speed on what you're working on with uh Mojo and modular yeah it's really great to talk to you Sam same same thank you

-----


-----
Date: 2023.06.02
Title: [Chris Lattner: Future of Programming and AI | Lex Fridman Podcast](https://www.youtube.com/watch?v=pdJQ8iVTwj8&t=6984s)
Transcription:

Introduction
- On one access, you have more hardware coming in. On the other hand, you have an explosion of innovation in AI.
And so what happened with both TensorFlow and PyTorch is that the explosion of innovation in AI has led to,
it's not just about matrix implication and convolution. These things have now, like, 2,000 different operators.
And on the other hand, you have, I don't know how many pieces of hardware out there are there, it's a lot. Part of my thesis,
part of my belief of where computing goes, if you look out 10 years from now, is it's not gonna get simpler.
Physics isn't going back to where we came from. It's only gonna get weirder from here on out, right?
And so to me, the exciting part about what we're building is it's about building that universal platform,
which the world can continue to get weird 'cause, again, I don't think it's avoidable, it's physics,
but we can help lift people, scale, do things with it, and they don't have to rewrite their code every time a new device comes out.
And I think that's pretty cool. - The following is a conversation with Chris Lattner,
his third time on this podcast. As I've said many times before, he's one of the most brilliant engineers
in modern computing, having created LLVM Compiler Infrastructure project, the Clang compiler, the Swift programming language,
a lot of key contributions to TensorFlow and TPUs as part of Google. He's served as Vice President
of Autopilot Software at Tesla, was a software innovator and leader at Apple.
And now he co-created a new full stack AI infrastructure
for distributed training, inference, and deployment on all kinds of hardware called Modular,
and a new programming language called Mojo. That is a superset of Python,
giving you all the usability of Python, but with the performance of C, C++.
In many cases, Mojo code has demonstrated over 30,000x speed up over Python.
If you love machine learning, if you love Python, you should definitely give Mojo a try.
This programming language, this new AI framework and infrastructure and this conversation with Chris is mind-blowing.
I love it. It gets pretty technical at times, so I hope you hang on for the ride.
This is the Lex Fridman podcast. To support it, please check out our sponsors in the description.
And now, dear friends, here's Chris Lattner. It's been, I think two years since we last talked,
Mojo programming language
and then in that time, you somehow went and co-created a new programming language called Mojo.
So it's optimized for AI. It's a superset of Python. Let's look at the big picture. What is the vision for Mojo?
- For Mojo? Well, so I mean, I think you have to zoom out. So I've been working on a lot of related technologies for many, many years.
So I've worked on LLVM and a lot of things and mobile and servers and things like this,
but the world's changing. And what's happened with AI is we have new GPUs and new machine learning accelerators
and other ASICs and things like that, that make AI go real fast. At Google, I worked on TPUs. That's one of the biggest,
largest scale deployed systems that exist for AI. And really what you see is,
if you look across all of the things that are happening in the industry, there's this new compute platform coming. And it's not just about CPUs, or GPUs, or TPUs,
or NPUs, or IPUs, or whatever, all the PUs, (chuckles) right? It's about, how do we program these things, right?
And so for software folks like us, right, it doesn't do us any good if there's this amazing hardware that we can't use.
And one of the things you find out really quick is that having the theoretical capability of programming something
and then having the world's power and the innovation of all the smart people in the world
get unleashed on something can be quite different. And so really where Mojo came from was,
starting from a problem of, we need to be able to take machine learning, take the infrastructure underneath it
and make it way more accessible, way more usable, way more understandable by normal people and researchers
and other folks that are not themselves like experts in GPUs and things like this. And then through that journey, we realized,
"Hey, we need syntax for this. We need to do a programming language." - So one of the main features of the language,
I say so, fully in jest, is that it allows you to have the file extension
to be an emoji or the fire emoji, which is one of the first
emojis used as a file extension I've ever seen in my life. And then you ask yourself the question, why in the 21st century,
we're not using Unicode for file extensions? This, I mean, it's an epic decision.
I think, clearly, the most important decision you made the most, but you could also just use M-O-J-O as the file extension.
- Well, so, okay. So take a step back. I mean, come on, Lex. You think that the world's ready for this? This is a big moment in the world, right?
- We're releasing this onto the world. (chuckles) - This is innovation. - I mean, it really is kinda brilliant.
Emojis are such a big part of our daily lives, why isn't it not in programming?
- Well, and like you take a step back and look at what file extensions are, right, they're basically metadata, right?
And so why are we spending all the screen space on them and all this stuff? Also, you know, you have them stacked up next to text files and PDF files and whatever else.
Like, if you're gonna do something cool, you want it to stand out, right? And emojis are colorful. They're visual. They're beautiful, right? - Yeah.
What's been the response so far from... Is there a support on like Windows on operating system- - Yeah.
- In displaying like File Explorer? - Yeah, yeah. The one problem I've seen is the git doesn't escape it, right?
And so it thinks that the fire emoji is unprintable. And so it like prints out weird hex things if you use the command line git tool,
but everything else, as far as I'm aware, works fine. And I have faith that Git can be improved. So I'm not worried. - And so GitHub is fine.
- GitHub is fine, yep. GitHub is fine. Visual Studio Code, Windows, like all this stuff, totally ready because people have internationalization
in their normal- - Yeah. - Part of their paths. So let's just like take the next step, right?
Somewhere between, "Oh, wow, that makes sense. Cool, I like new things," to "Oh my god, you're killing my baby.
Like, what are you talking about? This can never be. Like, I can never handle this. How am I gonna type this? (imitates bees buzzing) like, all these things.
And so this is something where I think that the world will get there. We don't have to bet the whole farm on this.
I think we can provide both paths, but I think it'll be great. - When can we have emojis as part of the code? I wonder.
- Yeah. So, I mean, lots of languages provide that. So I think that we have partial support for that. It's probably not fully done yet,
but yeah, you can do that. For example, in Swift, you can do that for sure. So an example we gave at Apple was
the dog cow. - Yeah. - So that's a classical Mac heritage thing. And so you use the dog and the cow emoji together,
and that could be your variable name, but of course, the internet went and made pile of poop for everything. - Yeah.
- So, you know, if you wanna name your function pile of poop, then you can totally go to town and see how that gets through code review.
(Lex chuckling) - Okay. So let me just ask a bunch of random questions.
So is Mojo primarily designed for AI or is it a general purpose programming? - Yeah, good question. So it's AI first.
And so AI is driving a lot of the requirements. And so Modular is building and designing
and driving Mojo forward. And it's not because it's an interesting project, theoretically, to build. It's because we need it.
And so at Modular, we're really tackling the AI infrastructure landscape and the big problems in AI
and the reasons that is so difficult to use and scale and adopt and deploy and like all these big problems in AI.
And so we're coming at it from that perspective. Now, when you do that, when you start tackling these problems, you realize that the solution to these problems
isn't actually an AI-specific solution. And so while we're doing this we're building Mojo to be a fully general programming language.
And that means that you can obviously tackle GPUs, and CPUs and, like, these AI things,
but it's also a really great way to build NumPy and other things like that, or, you know, just if you look at what many Python libraries are today,
often they're a layer of Python for the API, and they end up being C and C++ code underneath them.
That's very true in AI. That's true in lots of other demands as well. And so anytime you see this pattern, that's an opportunity for Mojo to help simplify the world
and help people have one thing. - So optimize through simplification by having one thing.
So you mentioned Modular. Mojo is the programming language. Modular is the whole software stack.
- So just over a year ago, we started this company called Modular. - [Lex] Yeah. - Okay, what Modular's about is, it's about taking AI and up-leveling it
into the next generation, right? And so if you take a step back, what's gone on in the last five, six, seven, eight years is
that we've had things like TensorFlow and PyTorch and these other systems come in. You've used them. You know this.
And what's happened is these things have grown like crazy, and they get tons of users. It's in production deployment scenarios.
It's being used to power so many systems. I mean, AI's all around us now. It used to be controversial years ago, but now it's a thing.
But the challenge with these systems is that they haven't always been thought out with current demands in mind.
And so you think about it. Where were LLMs eight years ago? (chuckles) Well, they didn't exist, right?
AI has changed so much, and a lot of what people are doing today are very different than when these systems were built.
And meanwhile, the hardware side of this has gone into a huge mess. There's tons of new chips and accelerators,
and every big company's announcing a new chip every day, it feels like. And so between that, you have like moving system on one side,
moving system on the other side, and it just turns into this gigantic mess, which makes it very difficult for people to actually use AI,
particularly in production deployment scenarios. And so what Modular's doing is we're helping build out that software stack
to help solve some of those problems so then people can be more productive and get more AI research into production.
Now, what Mojo does is it's a really, really, really important piece of that. And so that is, you know,
part of that engine and part of the technology that allows us to solve these problems. - So Mojo is a programming language that allows you to do
the higher level programming, the low-level programming, like do all kinds of programming in that spectrum
that gets you closer and closer to the hardware. - So take a step back. So Lex, what do you love about Python?
- Oh, boy. Where do I begin? What is love? What do I love about Python?
- [Chris] You're a guy who knows love. I know this. - Yes. How intuitive it is,
how it feels like I'm writing natural language English. - [Chris] Yeah.
- How, when I can not just write, but read other people's codes, somehow I can understand it faster.
It's more condensed than other languages, like ones I'm really familiar with, like C++ and C,
there's a bunch of sexy little features. - [Chris] Yeah. - We'll probably talk about some of them,
but list comprehensions and stuff like this. - Well, so Py... And don't forget the entire ecosystem of all the packages.
- [Lex] Oh, yeah. There's probably huge- - 'Cause there's always something. If you wanna do anything, there's always a package.
- Yeah, so it's not just the ecosystem of the packages and the ecosystem of the humans that do it.
That's an interesting dynamic because I think- - That's good. Yeah. - Something about the usability
and the ecosystem makes the thing viral, it grows, and then it's a virtuous cycle, I think. - Well, and there's many things that went into that.
Like, so I think that ML was very good for Python. And so I think that TensorFlow and PyTorch and these systems
embracing Python really took and helped Python grow, but I think that the major thing underlying it is
that Python's like the universal connector, right? It really helps bring together lots of different systems
so you can compose them and build out larger systems without having to understand how it works. But then, what is the problem with Python? (chuckles)
- Well, I guess you could say several things, but probably that it's slow. - I think that's usually what people complain about, right?
And so, slow. I mean, other people would complain about tabs and spaces versus curly braces or whatever,
but I mean, those people are just wrong 'cause it is- - Yeah. - Actually just better to use indentation.
- Wow, strong words. (Chris laughing) So actually, I just went on a small tangent. Let's actually take that. Let's take all kinds of tangents.
- Oh, come on, Lex. You can push me on it. I can take it. - Design, designed. Listen, I've recently left Emacs for VS Code.
- [Chris] Okay. - And the kinda hate mail I had to receive, because on the way to doing that, I also said, I've considered Vim.
- [Chris] Yep. - And chose not to and went with VS Code and just- - You're touching on deep religions, right?
- Anyway, tabs is an interesting design decision. And so you've really written a new programming language here.
Code indentation
Yes, it is a superset of Python, but you can make a bunch of different interesting decisions here. - Totally, yeah.
- And you chose actually to stick with Python in terms of some of the syntax.
- Well, so let me explain why, right? So I mean, you can explain this in many rational ways.
I think that the annotation is beautiful, but that's not a rational explanation, right, but I can defend it rationally, right?
So first of all, Python 1 has millions of programmers. It's huge. It's everywhere. - Yeah.
It owns machine learning, right? And so, factually, it is the thing, right? Second of all, if you look at it,
C code, SQL Plus code, Java, whatever, Swift, curly brace languages also run
through formatting tools and get indented. And so if they're not indented correctly,
first of all, will twist your brain around. (chuckles) It can lead to bugs. There's notorious bugs that have happened across time
where the annotation was wrong or misleading and it wasn't formatted right, and so it turned into an issue, right?
And so what ends up happening in modern large-scale code bases is people run automatic formatters.
So now what you end up with is indentation and curly braces. Well, if you're gonna have,
you know, the notion of grouping, why not have one thing, right, and get rid of all the clutter and have a more beautiful thing, right?
Also, you look at many of these languages, it's like, okay, well, you can have curly braces, or you can omit them if there's one statement,
or you just like enter this entire world of complicated design space that, objectively, you don't need if you have Python-style indentation, so.
- Yeah, I would love to actually see statistics on errors made because of indentation. Like, how many errors are made in Python versus in C++
that have to do with basic formatting, all that kinda stuff? I would love to see. - I think it's probably pretty minor because once you get,
like you use VS Code, I do too. So if you get VS Code set up, it does the annotation for you, generally, right? - Yep.
- And so you don't, you know, it's actually really nice to not have to fight it. And then what you can see is the editors telling you
how your code will work by indenting it, which I think is pretty cool. - I honestly don't think I've ever...
I don't remember having an error in Python because I indented stuff wrong. - Yeah. So I mean, I think that there's,
again, this is a religious thing. And so I can joke about it and I love to kind of, you know,
I realize that this is such a polarizing thing and everybody wants to argue about it. And so I like poking at the bear a little bit, right?
But frankly, right, come back to the first point, Python 1, like, it's huge. - Yeah. - It's in AI. It's the right thing.
For us, like, we see Mojo as being an incredible part of the Python ecosystem. We're not looking to break Python or change it,
or, quote, unquote, "fix it." We love Python for what it is. Our view is that Python is just not done yet.
And so if you look at, you know, you mentioned Python being slow. Well, there's a couple of different things that go into that, which we can talk about if you want.
But one of them is that it just doesn't have those features that you would use to do C-like programming.
And so if you say, okay, well, I'm forced out of Python into C, for certain use cases,
well, then what we're doing is we're saying, "Okay, well, why is that? Can we just add those features that are missing from Python back up to Mojo?"
And then you can have everything that's great about Python, all the things that you're talking about that you love plus not be forced out of it
when you do something a little bit more computationally intense, or weird, or hardware-y,
or whatever it is that you're doing. - Well, a million questions I wanna ask, but high level again- - Yeah.
- Is it compiled or is it an interpreted language? So Python is just-in-time compilation. What's Mojo?
- So Mojo, a complicated answer, does all the things. So it's interpreted, it's JIT compiled, and it's statically compiled. (chuckles)
And so this is for a variety of reasons. So one of the things that makes Python beautiful
is that it's very dynamic. And because it's dynamic, one of the things they added is that it has
this powerful metaprogramming feature. And so if you look at something like PyTorch or TensorFlow or, I mean, even a simple use case,
like you define a class that has the plus method, right, you can overload the dunder methods,
like dunder add, for example, and then the plus method works on your class. And so it has very nice and very expressive
dynamic metaprogramming features. In Mojo, we want all those features come in.
Like, we don't wanna break Python, we want it all to work. But the problem is, is you can't run those super dynamic features
on an embedded processor or on a GPU, right? Or if you could,
you probably don't want to just because of the performance. And so we entered this question of saying, okay, how do you get the power of this dynamic metaprogramming
into a language that has to be super efficient in specific cases? And so what we did was we said,
okay, well, take that interpreter. Python has an interpreter in it, right? Take that interpreter and allow it to run at compile time.
And so now what you get is you get compiled time metaprogramming. And so this is super interesting, super powerful,
because one of the big advantages you get is you get Python-style expressive APIs,
you get the ability to have overloaded operators. And if you look at what happens inside of, like PyTorch, for example,
with automatic differentiation and eager mode and like all these things, they're using these really dynamic and powerful features at runtime,
but we can take those features and lift them so that they run at compile time. - 'Cause C++ has metaprogramming with templates.
- [Chris] Yep. - But it's really messy. - It's super messy. It was accidentally, I mean,
different people have different interpretations. My interpretation is that it was made accidentally powerful.
It was not designed to be Turing-complete, for example, but that was discovered kind of along the way, accidentally.
And so there have been a number of languages in the space. And so they usually have templates or code instantiation,
code-copying features of various sorts. Some more modern languages or some newer languages, let's say,
like, you know, they're fairly unknown. Like Zig, for example, says, okay,
well, let's take all of those types you can run it, all those things you can do at runtime
and allow them to happen at compile time. And so one of the problems with C++, I mean,
which is one of the problems with C++ is- - There we go. Strong words. We're gonna offend everybody today.
- Oh, that's okay. I mean, everybody hates me for a variety of reasons anyways, I'm sure, right? (chuckles) I've written up-
- That's the way they show love is to hurt you. - I have written enough C++ code to earn a little bit of grumpiness with C++,
but one of the problems with it is that the metaprogramming system templates is just a completely different universe
from the normal runtime programming world. And so if you do metaprogramming and programming,
it's just like a different universe, different syntax, different concepts, different stuff going on. And so, again, one of our goals with Mojo is
to make things really easy to use, easy to learn, and so there's a natural stepping stone.
And so as you do this, you say, okay, well, I have to do programming at runtime, I have to do programming at compile time.
Why are these different things? - How hard is that to pull it off? 'Cause that sounds, to me, as a fan of metaprogramming and C++ even,
how hard is it to pull that off? That sounds really, really exciting 'Cause you can do the same style programming
at compile time and at runtime. That's really, really exciting. - Yep, yep, and so, I mean, in terms of the compiler implementation details, it's hard.
I won't be shy about that. It's super hard. It requires, I mean, what Mojo has underneath the covers is a completely new approach
to the design of the compiler itself. And so this builds on these technologies like MiR that you mentioned.
That also includes other, like caching and other interpreters and JIT compilers and other stuff like that-
- [Lex] So you have like an interpreter inside the- - Within the compiler, yes. - [Lex] Oh, man. - And so it really takes
the standard model of programming languages and kind of twists it and unifies it with the runtime model,
which I think is really cool. - Right. - And to me, the value of that is that, again, many of these languages have metaprogramming features.
Like, they grow macros or something, right? List, right? - Yes. - I know your roots, right? (Lex chuckling)
You know, and this is a powerful thing, right? And so, you know, if you go back to list, one of the most powerful things about it is
that it said that the metaprogramming and the programming are the same, right? And so that made it way simpler, way more consistent,
way easier to understand, reason about, and it made it more composable. So if you build a library, you can use it both at runtime and compile time,
which is pretty cool. - Yeah. And for machine learning, I think metaprogramming, I think we could generally say, is extremely useful.
The power of autotuning
And so you get features, I mean, I'll jump around, but the feature of auto-tuning
and adaptive compilation just blows my mind. - Yeah, well, so, okay. So let's come back to that.
- [Lex] All right. - So what is machine learning, like, what, or what is a machine learning model? Like, you take a PyTorch model
off the internet, right? - Yeah. - It's really interesting to me because what PyTorch and what TensorFlow
and all these frameworks are kinda pushing compute into is they're pushing into, like, this abstract specification of a compute problem,
which then gets mapped in a whole bunch of different ways, right? And so this is why it became a metaprogramming problem, is that you wanna be able to say,
cool, I have this neural net. Now, run it with batch size a thousand, right?
Do a mapping across batch. Or, okay, I wanna take this problem. Now, run it across a thousand CPUs or GPUs, right?
And so, like, this problem of, like, describe the compute, and then map it and do things and transform it, or, like,
actually it's very profound and that's one of the things that makes machine learning systems really special.
- Maybe can you describe auto-tuning and how do you pull off, I mean, I guess adaptive compilation is
what we're talking about is metaprogramming. How do you pull off- - Yes. - auto-tuning? I mean, is that as profound as I think it is?
It just seems like a really, like, you know, we'll mention list comprehensions. To me, from a quick glance of Mojo, which by the way,
I have to absolutely, like, dive in, as I realize how amazing this is,
I absolutely must dive in it, that looks like just an incredible feature for machine learning people.
- Yeah. Well, so what is auto-tuning? So take a step back. Auto-tuning is a feature in Mojo.
So very little of what we're doing is actually research, like many of these ideas have existed in other systems and other places.
And so what we're doing is we're pulling together good ideas, remixing them, and making them into a, hopefully, a beautiful system, right?
And so auto-tuning, the observation is that, turns out, hardware systems' algorithms are really complicated.
Turns out maybe you don't actually want to know how the hardware works, (chuckles) right? A lot of people don't, right?
And so there are lots of really smart hardware people, I know a lot of them, where they know everything about, "Okay,
the cache size is this and the number of registers is that. And if you use this what length of vector, it's gonna be super efficient because it maps directly
onto what it can do" and, like, all this kinda stuff, or, "the GPU has SMs and it has a warp size of," whatever, right,
all this stuff that goes into these things, or "The tile size of a TPU is 128," like, these factoids, right?
My belief is that most normal people, and I love hardware people, also I'm not trying to offend literally everybody on the internet,
but most programmers actually don't wanna know this stuff, right? And so if you come at it from perspective of,
how do we allow people to build both more abstracted but also more portable code because, you know,
it could be that the vector length changes or the cache size changes, or it could be that the tile size of your matrix changes, or, the number, you know,
an A100 versus an H100 versus a Volta versus a, whatever, GPU have different characteristics, right?
A lot of the algorithms that you run are actually the same, but the parameters, these magic numbers you have to fill in
end up being really fiddly numbers that an expert has to go figure out. And so what auto-tuning does is says,
okay, well, guess what? There's a lot of compute out there, right? So instead of having humans go
randomly try all the things or do a grid, search, or go search some complicated multi-dimensional space,
how about we have computers do that, right? And so what auto-tuning does is you can say, Hey, here's my algorithm.
If it's a matrix operation or something like that, you can say, okay, I'm gonna carve it up into blocks,
I'm gonna do those blocks in parallel and I wanna this, with 128 things that I'm running on,
I wanna cut it this way or that way or whatever. And you can say, hey, go see which one's actually empirically better on the system.
- And then the result of that you cache for that system. You save it. - Yep. And so come back to twisting your compiler brain, right?
So not only does the compiler have an interpreter that's used to do metaprogramming, that compiler, that interpreter,
that metaprogramming now has to actually take your code and go run it on a target machine, (chuckles)
see which one it likes the best, and then stitch it in and then keep going, right? - So part of the compilation is machine-specific.
- Yeah. Well, so I mean, this is an optional feature, right? So you don't have to use it for everything, but yeah. So one of the things that we're in the quest
of is ultimate performance, right? - Yes. - Ultimate performance is important for a couple of reasons, right?
So if you're an enterprise, you're looking to save costs and compute and things like this. Ultimate performance translates to,
you know, fewer servers. Like, if you care about the environment, hey, better performance leads to more efficiency, right?
I mean, you could joke and say like, you know, Python's bad for the environment, (chuckles) right? And so if you move to Mojo,
it's like, at least 10x better just outta the box, and then keep going, right? - Yeah.
- But performance is also interesting 'cause it leads to better products. - Yeah. - And so in the space of machine learning, right,
if you reduce the latency of a model so that it runs faster so every time you query the server
running the model it takes less time, well, then the product team can go and make the model bigger. Well, that's actually makes it
so you have a better experience as a customer. And so a lot of people care about that. - So for auto-tuning, for like tile size,
you mentioned 120f for TPU. You would specify like a bunch of options to try, just in the code- - Yeah. Yep.
- Just simple statement, and then you could just- - Yep. - Set and forget and know, depending wherever it compiles,
it'll actually be the fastest. - And yeah, exactly. And the beauty of this is that it helps you in a whole bunch of different ways, right?
So if you're building... So often what'll happen is that, you know, you've written a bunch of software yourself, right, you wake up one day, you say,
"I have an idea. I'm gonna go code up some code." I get to work, I forget about it, I move on with life.
I come back six months, or a year, or two years, or three years later, you dust it off, and you go use it again in a new environment.
And maybe your GPU is different. Maybe you're running on a server instead of a laptop, maybe you're, whatever, right?
And so the problem now is you say, okay, well, I mean, again, not everybody cares about performance, but if you do, you say, okay,
well, I wanna take advantage of all these new features. I don't wanna break the old thing though, right?
And so the typical way of handling this kinda stuff before is, you know, if you're talking about C++ templates
or you're talking about C with macros, you end up with #ifdefs. You get like all these weird things that get layered in,
make the code super complicated, and then how do you test it, right? Becomes this crazy complexity,
multidimensional space that you have to worry about. And, you know, that just doesn't scale very well.
- Actually, lemme just jump around, before I go to some specific features, like the increase in performance here that we're talking
about can be just insane. - Yeah. - You write that Mojo can provide a 35,000x speed up over Python.
How does it do that? - Yeah, so I can even do more, but we'll get to that.
So first of all, when we say that, we're talking about what's called CPython, it's the default Python that everybody uses.
When you type Python 3, that's like typically the one you use, right? CPython is an interpreter.
And so interpreters, they have an extra layer of, like bike codes and things like this, that they have to go read, parse, interpret,
and it makes them kind of slow from that perspective. And so one of the first things we do is we moved to a compiler.
And so just moving to a compiler, getting the interpreter out of the loop is 2 to 5 to 10x speed up, depending on the code.
So just out of the gate, it's using more modern techniques right?
Now, if you do that, one of the things you can do is you can start to look at how CPython started to lay out data.
And so one of the things that CPython did, and this isn't part of the Python spec necessarily,
but this is just sets of decisions, is that, if you take an integer for example,
it'll put it in an object 'cause in Python, everything's an object. And so they do the very logical thing
of keeping the memory representation of all objects the same. So all objects have a header, they have like payload data.
And what this means is that every time you pass around an object, you're passing around a pointer to the data.
Well, this has overhead, right? Turns out that modern computers don't like chasing pointers very much and things like this.
It means that you have to allocate the data. It means you have to reference count it, which is another way that Python uses
to keep track of memory. And so this has a lot of overhead. And so if you say, okay,
let's try to get that out of the heap, out of a box, out of an indirection and into the registers,
that's another 10x, more. - So it adds up if you're reference counting every single- - Absolutely. - every single thing you create, that adds up.
- Yep, and if you look at, you know, people complain about the Python GIL, this is one of the things that hurts parallelism.
That's because the reference counting, right? And so the GIL and reference counting are very tightly intertwined in Python.
It's not the only thing, but it's very tightly intertwined. And so then you lean into this and you say, okay, cool. Well, modern computers,
they can do more than one operation at a time. And so they have vectors. What is a vector? Well, a vector allows you to,
instead of taking one piece of data, doing an add or multiply and then pick up the next one, you can now do a 4, 8, or 16 or 32 at a time, right?
Well, Python doesn't expose that because of reasons. And so now you can say, okay, well, you can adopt that.
Now you have threads. Now you have like additional things, like you can control memory hierarchy. And so what Mojo allows you to do is it allows you
to start taking advantage of all these powerful things that have been built into the hardware over time.
The library gives very nice features. So you can say, just parallelize this. Do this in parallel, right?
So it's very, very powerful weapons against slowness, which is why people have been, I think having fun,
like just taking code and making go fast because it's just kind of an adrenaline rush to see like how fast you can get things.
Typed programming languages
- Before I talk about some of the interesting stuff with parallelization and all that, let's first talk about, like, the basics.
We talked the indentation, right? So this thing looks like Python. It's sexy and beautiful like Python as I mentioned.
- [Chris] Yep. - Is it a typed language? So what's the role of types? - Yeah, good question. So Python has types.
It has strings, it has integers, it has dictionaries and like all that stuff, but they all live at runtime, right?
And so because all those types live at runtime in Python, you never or you don't have to spell them. (chuckles)
Python also has like this whole typing thing going on now and a lot of people use it. - [Lex] Yeah. - I'm not talking about that.
That's kind of a different thing. We can go back to that if you want, but typically the,
you know, you just say, I have a def and my def takes two parameters. I'm gonna call them A and B and I don't have to write or type okay?
So that is great, but what that does is that forces what's called a consistent representation.
So these things have to be a pointer to an object with the object header and they all have to look the same.
And then when you dispatch a method, you go through all the same different paths no matter what the receiver, whatever that type is.
So what Mojo does is it allows you to have more than one kind of type. And so what it does is allows you to say, okay, cool.
I have an object and objects behave like Python does. And so it's fully dynamic and that's all great. And for many things, classes, like,
that's all very powerful and very important. But if you wanna say, hey, it's an integer and it's 32 bits,
or it's 64 bits or whatever it is, or it's a floating point value and it's 64 bits,
well, then the compiler can take that, and it can use that to do way better optimization. And it turns out, again,
getting rid of the indirections, that's huge. Means you can get better code completion
'cause compiler knows what the type is and so it knows what operations work on it. And so that's actually pretty huge.
And so what Mojo does is allows you to progressively adopt types into your program.
And so you can start, again, it's compatible with Python, and so then you can add however many types you want,
wherever you want them. And if you don't wanna deal with it, you don't have to deal with it, right? And so one of, you know, our opinions on this, (chuckles)
it's that it's not that types are the right thing or the wrong thing, it's that they're a useful thing.
- So it's kind of optional, it's not strict typing, like, you don't have to specify type. - [Chris] Exactly. - Okay, so it's starting from the thing
that Python's kinda reaching towards right now with trying to inject types into it,
what it's doing. - Yeah, with a very different approach, but yes, yeah. - So what's the different approach? I'm actually one of the people (sighs)
that have not been using types very much in Python. So I haven't- - That's okay. Why did you sigh?
- It just, well, because I know the importance. It's like adults use strict typing.
And so I refuse to grow up in that sense. It's a kind of rebellion, but I just know that it probably reduces
the amount of errors, even just for, forget about performance improvements, it probably reduces errors of when you do strict typing.
- Yeah, so I mean, I think it's interesting if you look at that, right? And the reason I'm giving you a hard time then is that- - Yes.
- there's this cultural norm, this pressure, this, like, there has to be a right way to do things.
Like, you know- - Yes. - grownups only do it one way. And if you don't do that- - Yes. - you should feel bad, right? - Yes. - Like, some people feel like Python's a guilty pleasure
or something, and that's like, when it gets serious, I need to go rewrite it, right? Well, I mean, cool. - Exactly.
- I understand history and I understand kinda where this comes from, but I don't think it has to be a guilty pleasure, (chuckles) right? - Yeah.
- So if you look at that, you say, why do you have to rewrite it? Well, you have to rewrite it to deploy. Well, why do you wanna deploy?
Well, you care about performance, or you care about predictability, or you want, you know, a tiny thing on the server that has no dependencies, or,
you know, you have objectives that you're trying to attain. So what if Python can achieve those objectives?
So if you want types, well, maybe you want types because you wanna make sure you're passing the right thing. Sure, you can add a type.
If you don't care, you're prototyping some stuff, you're hacking some things out, you're, like, pulling some random code off the internet,
it should just work, (chuckles) right? And you shouldn't be, like, pressured. You shouldn't feel bad about doing the right thing
or the thing that feels good. Now, if you're in a team, right, you're working at some massive internet company
and you have 400 million lines of Python code, well, they may have a house rule that you use types,
right? - Yeah. - Because it makes it easier for different humans to talk to each other and understand what's going on and bugs at scale, right?
And so there are lots of good reasons why you might wanna use types, but that doesn't mean that everybody
should use 'em all the time, right? So what Mojo does is it says, cool. Well, allow people to use types and if you use types,
you get nice things out of it, right? You get better performance and things like this, right? But Mojo is a full, compatible superset of Python, right?
And so that means it has to work without types. (chuckles) It has to support all the dynamic things. It has to support all the packages.
It has to support for comprehension, list comprehensions and things like this, right?
And so that starting point I think is really important. And I think that, again,
you can look at why I care so much about this. And there's many different aspects of that, one of which is the world went through a very challenging
migration from Python 2 to Python 3, right? - [Lex] Yes. - This migration took many years
and it was very painful for many teams, right? - Yeah. - And there's of a lot of things that went on in that.
I'm not an expert in all the details and I honestly don't wanna be. I don't want the world to have to go through that, (chuckles) right? - Yeah.
- And, you know, people can ignore Mojo. And if it's not their thing, that's cool. But if they wanna use Mojo, I don't want them to have to rewrite all their code.
- Yeah, I mean, this, okay, the superset part is just, I mean, there's so much brilliant stuff here.
That definitely is incredible. We'll talk about that. - Yeah. - First of all,
how's the typing implemented differently in Python versus Mojo? - Yeah.
- So this heterogeneous flexibility you said is definitely implemented. - Yeah, so I'm not a full expert
(chuckles) in the whole backstory on types in Python. So I'll give you that. I can give you my understanding.
My understanding is, basically, like many dynamic languages, the ecosystem went through a phase
where people went from writing scripts to writing large scale, huge code bases in Python.
And at scale, kinda helps have types. - Yeah. - People wanna be able to reason about interfaces,
do you expect string, or an int, or, like, these basic things, right? And so what the Python community started doing is
it started saying, okay, let's have tools on the side, checker tools, right, that go and, like,
enforce a variance, check for bugs, try to identify things. These are called static analysis tools generally.
And so these tools run over your code and try to look for bugs. What ended up happening is there's so many of these things, so many different weird patterns and different approaches
on specifying the types and different things going on, that the Python community realized and recognized, "Hey, hey, hey, there's the thing here." (chuckles)
And so what they started to do is they started to standardize the syntax for adding types to Python. Now, one of the challenges that they had is
that they're coming from kinda this fragmented world where there's lots of different tools, they have different trade-offs and interpretations
and the types mean different things. And so if you look at types in Python, according to the Python spec, the types are ignored, right?
So according to the Python spec, you can write pretty much anything (chuckles) in a type position, okay?
Technically, you can write any expression, okay? Now, that's beautiful because you can extend it.
You can do cool things, you can write, build your own tools, you can build your own house, linter or something like that, right?
But it's also a problem because any existing Python program may be using different tools
and they have different interpretations. And so if you adopt somebody's package into your ecosystem, try to run the tool you prefer,
it may throw out tons of weird errors and warnings and problems just because it's incompatible with how these things work.
Also because they're added late and they're not checked by the Python interpret, it's always kinda more of a hint that it is a requirement.
Also, the CPython implementation can't use 'em for performance. And so it's really- - I mean, that's a big one, right?
So you can't utilize for the compilation, for the just-in-time compilation, okay. - Yep, yep, exactly. And this all comes back to the design principle of,
they're kinda hints, they're kind of, the definition's a little bit murky. It's unclear exactly the interpretation in a bunch of cases.
And so because of that, you can't actually, even if you want to, it's really difficult to use them to say,
like, it is going to be an int, and if it's not, it's a problem, right? A lot of code would break if you did that, so.
So in Mojo, right, so you can still use those kind of type annotations, it's fine. But in Mojo, if you declare a type and you use it,
then it means it is going to be that type. And the compiler helps you check that, and enforce it and it's safe
and it's not a, like, best-effort hint kind of a thing. - So if you try to shove a string type thing into a integer-
- [Chris] You get an error from the compiler. - From the compiler compile time. Nice, okay.
What kinda basic types are there? - Yeah. So Mojo is pretty hardcore in terms of what it tries to do
in the language, which is the philosophy there is that we,
again, if you look at Python, right, Python's a beautiful language because it's so extensible, right? And so all of the different things in Python,
like for loops and plus and like all these things can be accessed through these underbar armbar methods, okay?
So you have to say, okay, if I make something that is super fast, I can go all the way down to the metal.
Why do I need to have integers built into the language, right? And so what Mojo does is it says, okay,
well, we can have this notion of structs. So you have classes in Python. Now you can have structs.
Classes are dynamic, structs are static. Cool. We can get high performance. We can write C++ kind of code with structs if you want.
These things mix and work beautifully together, but what that means is that you can go and implement strings and ints and floats and arrays
and all that kinda stuff in the language, right? And so that's really cool because, you know,
to me as a idealizing compiler language type of person,
what I wanna do is I wanna get magic out of the compiler and put in the libraries. Because if somebody can, you know,
if we can build an integer that's beautiful and it has an amazing API and it does all the things you'd expect an integer to do, we don't like it,
maybe you want a big integer, maybe you want, like, sideways integer, I don't know, like what all the space of integers are,
then you can do that, and it's not a second class citizen. And so if you look at certain other languages,
like C++, one I also love and use a lot, int is hardcoded in the language,
but complex is not. And so isn't it kinda weird that, you know, you have this STD complex class, but you have int,
and complex tries to look like a natural numeric type and things like this. But integers and floating point have these, like,
special promotion rules and other things like that, that are magic and they're hacked into the compiler. And because of that, you can't actually make something
that works like the built-in types. - Is there something provided as a standard because,
you know, because it's AI first, you know, numerical types are so important here.
So is there something, like a nice standard implementation of indigent flows? - Yeah, so we're still building all that stuff out.
So we provide integers and floats and all that kinda stuff. We also provide like buffers and tensors and things like that you'd expect in an ML context.
Honestly, we need to keep designing and redesigning and working with the community to build that out and make that better. That's not our strength right now.
Give us six months or a year and I think it'll be way better, but the power of putting in the library means
that we can have teams of experts that aren't compiler engineers that can help us design and refine and drive this forward.
- So one of the exciting things we should mention here is that this is new and fresh.
This cake is unbaked. It's almost baked. You can tell it's delicious,
but it's not fully ready to be consumed. - Yep. That's very fair. It is very useful, but it's very useful if you're
a super low-level programmer right now. And what we're doing is we're working our way up the stack. And so the way I would look at Mojo today
in May and 2023 is that it's like a 0.1.
So I think that, you know, a year from now, it's gonna be way more interesting to a variety of people.
But what we're doing is we decide to release it early so that people can get access to it and play with it. We can build it with the community.
We have a big roadmap, fully published, being transparent about this
and a lot of people are involved in this stuff. And so what we're doing is we're really optimizing for building this thing the right way.
And building it the right way is kind of interesting, working with the community, because everybody wants it yesterday.
And so sometimes it's kind of, you know, there's some dynamics there, but I think- - Yeah.
- it's the right thing. - So there's a Discord also. So the dynamics is pretty interesting. - [Chris] Yeah.
- Sometimes the community probably can be very chaotic and introduce a lot of stress.
Guido famously quit over the stress of the Walrus operator. I mean, it's, you know- - Yeah, yeah. - It broke...
- [Chris] Straw that broke the camel's back. - Exactly. And so, like, it could be very stressful to develop, but can you just add a tangent upon a tangent?
Is it stressful to work through the design of various features here,
given that the community is recently involved? - Well, so I've been doing open development
and community stuff for decades now. (chuckles) Somehow this has happened to me. So I've learned some tricks,
but the thing that always gets me is I wanna make people happy, right? And so maybe not all people all happy all the time,
but generally, - Yeah. - I want people to be happy, right? And so the challenge is that again, we're tapping into some long,
some deep seated long tensions and pressures both in the Python world, but also in the AI world,
in the hardware world and things like this. And so people just want us to move faster, right? And so again, our decision was, "Let's release this early.
Let's get people used to it or access to it and play with it. And like, let's build in the open,"
which we could have, you know, had the language monk sitting in the cloister up on the hilltop,
like beavering away trying to build something. But in my experience, you get something that's way better if you work with the community, right?
And so, yes, it can be frustrating, can be challenging for lots of people involved. And, you know, if you, I mean, you mentioned our Discord.
We have over 10,000 people on the Discord, 11,000 people or something. Keep in mind we released Mojo like two weeks ago.
(chuckles) Yeah. So- - It's very active. - So it's very cool, but what that means is that, you know, 10,
11,000 people all will want something different, right? And so what we've done is we've tried to say,
Okay, cool. Here's our roadmap. And the roadmap isn't completely arbitrary.
It's based on here's the logical order in which to build these features or add these capabilities and things like that.
And what we've done is we've spun really fast on like bug fixes. And so we actually have very few bugs, which is cool,
I mean, actually for a project in this state, but then what we're doing is we're dropping in features very deliberately.
- I mean, this is fun to watch 'cause you got the two gigantic communities of, like, hardware, like systems engineers,
and then you have the machine learning Python people that are like higher level.
- [Chris] Yeah. - And it's just two, like, army, like- - They've both, they've been at war, yeah.
(Lex chuckling) They've been at war, right? And so here's- - [Lex] It's a Tolkien novel or something. Okay. - Well, so here's a test.
And again, like, it's super funny for something that's only been out for two weeks, right? People are so impatient, right?
But, okay, cool, let's fast forward a year. Like, in a year's time, Mojo will be actually quite amazing
and solve tons of problems and be very good. People still have these problems, right?
And so you look at this and you say, and the way I look at this at least is to say, okay, well, we're solving big, long-standing problems.
To me, again, working on many different problems, I wanna make sure we do it right, right? There's like a responsibility you feel
because if you mess it up, (chuckles) right, there's very few opportunities to do projects like this and have them really have impact on the world.
If we do it right, then maybe we can take those feuding armies and actually heal some of those wounds,
right? - Yeah. - This feels like a speech by George Washington or Abraham Lincoln or something.
- And you look at this and it's like, okay, well, how different are we? - [Lex] Yeah. - We all want beautiful things. We all want something that's nice.
We all wanna be able to work together. We all want our stuff to be used, right? And so if we can help heal that, now I'm not optimistic that all people
will use Mojo and they'll stop using C++, like, that's not my goal, (chuckles) right, but if we can heal some of that,
I think that'd be pretty cool. That'd be nice. - Yeah, and we start by putting the people who like braces into the Gulag, no. (chuckles)
- So there are proposals for adding braces to Mojo and we just we tell them no. - Oh, interesting. - Oh, okay, (laughs) (Chris laughing)
politely, yeah, anyway. So there's a lot of amazing features on the roadmap and those already implemented, it'd be awesome
Immutability
if I could just ask you a few things. So- - Yeah, go for it. - So the other performance improvement
comes from immutability. So what's this var and this let thing that we got going on?
And what's immutability? - Well, so... - Yeah, so one of the things that is useful,
and it's not always required, but it's useful, is knowing whether something can change out from underneath you, right?
And so in Python, you have a pointer to an array, right? And so you pass that pointer to an array around to things.
If you pass into a function, they may take that and scroll away in some other data structure. And so you get your array back and you go to use it.
And now somebody else is like putting stuff in your array. How do you reason about that? - Yeah. - It gets to be very complicated
and leads to lots of bugs, right? And so one of the things that, you know, again, this is not something Mojo forces on you,
but something that Mojo enables is this thing called value semantics. And what value semantics do is they take collections,
like array, like dictionaries, also tensors and strings and things like this that are
much higher level and make them behave like proper values. And so it makes it look like,
if you pass these things around, you get a logical copy of all the data. And so if I pass you an array, it's your array.
You can go do what you want to it, you're not gonna hurt my array. Now that is an interesting and very powerful design principle.
It defines away a ton of bugs. You have to be careful to implement it in an efficient way. - Yeah, is there a performance hit that's significant?
- Generally not if you implement it the right way, but it requires a lot of very low-level getting-the-language-right bits.
- I assume that'd be a huge performance hit 'cause the benefit is really nice 'cause you don't get into these-
- Absolutely. Well, the trick is you can't do copies. So you have to provide the behavior
of copying without doing the copy. - [Lex] Yeah. How do you do that? (Chris laughing)
How do you do that? - It's not magic. It's just- - Okay. - It's actually pretty cool. Well, so first, before we talk about how that works,
let's talk about how it works in Python, right? So in Python you define a person class, or maybe a person class is a bad idea.
You define a database class, right? And a database class has an array of records, something like that, right? And so the problem is,
is that if you pass in a record or a class instance into the database, it'll take a hold of that object
and then it assumes it has it. And if you're passing an object in, you have to know that that database is gonna take it,
and therefore you shouldn't change it after you put it in the database, right? This is- - You just kinda have to know that. - You just have to kinda know that, right?
And so you roll out version one of the database. You just kinda have to know that. Of course, Lex uses his own database, right?
- [Lex] Yeah. - Right, 'cause you built it, you understand how this works, right? Somebody else joins the team, they don't know this, right? - Yes.
- And so now they suddenly get bugs, you're having to maintain the database, you shake your fist, you argue.
The 10th time this happens, you're like, okay, we have to do something different, right? And so what you do is you go change your Python code
and you change your database class to copy the record every time you add it. And so what ends up happening is you say, okay,
I will do what's called a defensive copy inside the database. And then that way if somebody passes something in,
I will have my own copy of it and they can go do whatever and they're not gonna break my thing, (chuckles) okay?
This is usually the two design patterns. If you look in PyTorch, for example, this is cloning a tensor.
Like, there's a specific thing and you have to know where to call it. And if you don't call it in the right place, you get these bugs and this is state-of-the-art, right?
So a different approach, so it's used in many languages, so I've worked with it in Swift, is you say, okay,
well, let's provide value semantics. And so we wanna provide the view that you get a logically independent copy, but we wanna do that lazily.
And so what what we do is we say, okay, if you pass something into a function, it doesn't actually make a copy.
What it actually does is it just increments a reference to it. And if you pass it around, you stick in your database,
it can go into the database, you own it. And then you come back outta the stack, nobody's copied anything, you come back outta the stack,
and then the caller let's go of it. Well, then you've just handed it off to the database,
you've transferred it and there's no copies made. Now, on the other hand, if, you know,
your coworker goes and hands you a record and you pass it in, you stick it in the database, and then you go to town and you start modifying it,
what happens is you get a copy lazily on demand. And so what this does,
this gives you copies only when you need them. So it defines the way the bugs, but it also generally reduces
the number of copies in practice. And so it's- - But the implementation details are tricky here, I assume. - Yes, yes.
- Something with reference counting, but to make it performant across a number of different kinds of objects?
- Yeah. Well, so you need a couple of things. So this concept has existed in many different worlds.
And so it's, again, it's not novel research at all, right? The magic is getting the design right
so that you can do this in a reasonable way, right? And so there's a number of components that go into this. One is when you're passing around,
so we're talking about Python and reference counting and the expense of doing that. When you're passing values around,
you don't wanna do extra reference counting for no good reason. And so you have to make sure that you're efficient and you transfer ownership instead of duplicating references
and things like that, which is a very low-level problem. You also have to adopt this,
and you have to build these data structures. And so if you say, you know, Mojo has to be compatible with Python,
so of course the default list is a reference semantic list that works the way you'd expect in Python,
but then you have to design a value semantic list. And so you just have to implement that, and then you implement the logic within.
And so the role of the language here is to provide all the low-level hooks that allow the author of the type
to be able to get and express this behavior without forcing it into all cases or hard coding this into the language itself.
- But there's ownership? So you're constantly transferring, you're tracking who owns the thing. - Yes. And so there's a whole system called ownership.
And so this is related to work done in the Rust community. Also, the Swift community has done a bunch of work
and there's a bunch of different other languages that have all kind of... C++ actually has copy constructors and destructors and things like that.
And so, and I mean, C++ has everything. So it has move constructors and has like this whole world of things.
And so this is a body of work that's kind of been developing for many, many years now.
And so Mojo takes some of the best ideas out of all these systems and then remixes in a nice way
so that you get the power of something like the Rust programming language, but you don't have to deal with it when you don't want to,
which is a major thing in terms of teaching and learning and being able to use and scale these systems.
- How does that play with argument conventions? What are they? Why are they important? How does the value semantics,
how does the transfer ownership work with the arguments when they're passing definitions? - Yeah. So if you go deep into systems programming land,
so this isn't, again, this is not something for everybody, but if you go deep into systems programming land, what you encounter is you encounter
these types that get weird. (chuckles) So if you're used to Python, you think about everything.
I can just copy it around. I can go change it and mutate it and do these things and it's all cool.
If you get into systems programming land, you get into these things, like, I have an atomic number, or I have a mutex,
or I have a uniquely owned database handle, things like this, right?
So these types, you can't necessarily copy. Sometimes you can't necessarily even move them to a different address.
And so what Mojo allows you to do is it allows you to express, hey, I don't wanna get a copy of this thing.
I wanna actually just get a reference to it. And by doing that, what you can say is, you can say, okay, if I'm defining something weird like a, you know,
atomic number or something, it's like, it has to be... So an atomic number is an area in memory
that multiple threads can access at a time without synchronous, without locks, right?
And so, like the definition of atomic numbers, multiple different things have to be poking at that, therefore they have to agree on where it is,
(chuckles) right? So you can't just like move it out from underneath one because it kinda breaks what it means.
And so that's an example of a type that you can't copy, you can't move it. Like, once you create, it has to be where it was, right?
Now, if you look at many other examples, like a database handle, right, so, okay, well, what happens?
How do you copy a database handle? Do you copy the whole database? That's not something you necessarily wanna do.
There's a lot of types like that where you wanna be able to say that they are uniquely owned.
So there's always one of this thing, or if I create a thing, I don't copy it.
And so what Mojo allows you to do is it allows you to say, Hey, I wanna pass around in reference to this thing without copying it, and so it has borrowed conventions.
So you can say, you can use it, but you don't get to change it. You can pass it by mutable reference.
And so if you do that, then you get a reference to it, but you can change it. And so it manages all that kinda stuff.
- So it's just a really nice implementation of, like, C++ has- - Yeah.
- you know, different kinds of pointers. - Reference, yeah, has pointers. - Smart, smart, different kinds of implementations of smart pointers
that you can- - Yeah. - explicitly define, this allows you, but you're saying that's more like the weird case
versus the common case? - Well, it depends on where, I mean, I don't think I'm a normal person,
so. - Yes. - I mean, I'm not one to call other people weird. - [Lex] Yeah. (Chris chuckling)
But, you know, if you talk to a typical Python programmer, you're typically not thinking about this, right? This is a lower level of abstraction.
Now, certainly if you talk to a C++ programmer, certainly if you talk to a Rust programmer, again, they're not weird, they're delightful.
Like, these are all good people, right? Those folks will think about all the time, right?
And so I look at this as, there's a spectrum between very deep, low-level systems, I'm gonna go poke the bits
and care about how they're laid out in memory, all the way up to application and scripting and other things like this.
And so it's not that anybody's right or wrong, it's about how do we build one system that scales?
- By the way, the idea of an atomic number has been something that always brought me deep happiness,
because the flip side of that, the idea that threads can just modify stuff
asynchronously, just the whole idea of concurrent programming is a source of infinite distrust for me.
- Well, so this is where you jump into, you know, again, you zoom out and get out of program languages or compilers
and you just look at what the industry has done, my mind is constantly blown by this, right? And you look at what, you know, Moore's law,
Moore's Law is this idea that, like computers, for a long time, single thread performance just got faster and faster and faster and faster for free.
But then physics and other things intervened, and power consumption, like other things started to matter.
And so what ended up happening is we went from single core computers to multi-core, then we went to accelerators, right?
And this trend towards specialization of hardware is only gonna continue. And so for years,
us programming language nerds and compiler people have been saying, okay, well, how do we tackle multi-core, right?
For a while it was like, "Multi-core is the future. We have to get on top of this thing." And then it was multi-core is the default. "What are we doing with this thing?"
And then it's like, there's chips with hundreds of cores in them. (chuckles) What will happen, right? - Yeah.
- And so I'm super inspired by the fact that, you know, in the face of this, you know,
those machine learning people invented this idea of a tensor, right? And what's a tensor?
A tensor is like an arithmetic and algebraic concept. It's like an abstraction
around a gigantic parallelizable dataset, right? And because of that and because of things
like TensorFlow and PyTorch, we're able to say, okay, we'll express the math of the system.
This enables you to do automatic differentiations, enables you to do like all these cool things.
And it's an abstracted representation. Well, because you have that abstract representation, you can now map it onto these parallel machines
without having to control, okay, put that bite here, put that bite there, put that bite there. And this has enabled an explosion in terms of AI,
compute, accelerators, like all the stuff. And so that's super, super exciting. - What about the deployment
Distributed deployment
and the execution across multiple machines? - [Chris] Yeah. - So you write that the Modular compute platform
dynamically partitions models with billions of parameters and distributes their execution across multiple machines,
enabling unparalleled efficiency. By the way, the use of unparalleled in that sentence...
Anyway. (Chris chuckling) Enabling unparalleled efficiency, scale, and the reliability for the largest workloads. So how do you do this
abstraction of distributed Deployment of large models?
- Yeah, so one of the really interesting tensions, so there's a whole bunch of stuff that goes into that. I'll pick a random walk through it.
If you go back and replay the history of machine learning, right, I mean, the brief, most recent history of machine learning,
'cause this is, as you know, very deep. - [Lex] Yeah. - I knew Lex when he had an AI podcast.
- [Lex] Yes. (Chris chuckling) - [Chris] Right? - Yeah, (chuckles) yeah.
- So if you look at just TensorFlow and PyTorch, which is pretty recent history in the big picture, right, but TensorFlow is all about graphs.
PyTorch, I think pretty unarguably ended up winning. And why did it win? Mostly because the usability, right?
And the usability of PyTorch is I think, huge. And I think, again, that's a huge testament to the power of taking abstract,
theoretical technical concepts and bringing it to the masses, right? Now the challenge with what the TensorFlow
versus the PyTorch design points was that TensorFlow's kinda difficult to use for researchers,
but it was actually pretty good for deployment. PyTorch is really good for researchers. It kind of not super great for deployment, right?
And so I think that we as an industry have been struggling. And if you look at what deploying a machine learning model
today means is that you'll have researchers who are, I mean, wicked smart, of course, but they're wicked smart at model architecture
and data and calculus and (chuckles) like all, like, they're wicked smart in various domains.
They don't wanna know anything about the hardware deployment or C++ or things like this, right? And so what's happened is you get people who train the model,
they throw it over the fence, and then you have people that try to deploy the model.
Well, every time you have a Team A does x, they throw it over the fence,
Team B does y, like you have a problem, because of course it never works the first time. And so you throw over the fence, they figure out, okay,
it's too slow, won't fit, doesn't use the right operator, the tool crashes, whatever the problem is,
then they have to throw it back over the fence. And every time you throw a thing over a fence, it takes three weeks of project managers
and meetings and things like this. And so what we've seen today is that getting models in production can take weeks or months.
Like, it's not atypical, right? I talk to lots of people and you talk about, like VP of software at some internet company
trying to deploy a model, and they're like, why do I need a team of 45 people? (chuckles) Like, it's so easy trying to model.
Why can't I deploy it, right? And if you dig into this, every layer is problematic.
So if you look at the language piece, I mean, this is tip of the iceberg. It's a very exciting tip of the iceberg for folks,
but you've got Python on one side and C++ on the other side. Python doesn't really deploy.
I mean, can theoretically, technically in some cases, but often a lot of production teams will wanna get things out of Python
because they get better performance and control and whatever else. So Mojo can help with that.
If you look at serving, so you talk about gigantic models, well, a gigantic model won't fit on one machine, right?
And so now you have this model, it's written Python, it has to be rewritten in C++.
Now it also has to be carved up so that half of it runs on one machine, half of it runs on another machine, or maybe it runs on 10 machines.
Well, so now, suddenly, the complexity is exploding, right? And the reason for this is
that if you look into TensorFlow or PyTorch, these systems, they weren't really designed for this world, right?
They were designed for, you know, back in the day when we were starting and doing things where it was a different, much simpler world,
like you wanted to run ResNet-50 or some ancient model architecture like this. It was a completely different world than-
- Trained on one GPU. - [Chris] Exactly. AlexNet. - Doing it on one GPU. (chuckles) - Yeah, AlexNet, right, the major breakthrough,
and the world has changed, right? And so now the challenge is, is that TensorFlow, PyTorch, these systems, they weren't actually designed for LLMs,
like, that was not a thing. And so where TensorFlow actually has amazing power in terms of scale and deployment and things like that,
and I think Google is, I mean, maybe not unmatched, but they're, like, incredible, in terms of their capabilities and gigantic scale,
many researchers using PyTorch, right? And so PyTorch doesn't have those same capabilities.
And so what Modular can do is it can help with that. Now, if you take a step back and you say like, what is Modular doing, right?
So Modular has like a bitter enemy that we're fighting against in the industry.
And it's one of these things where everybody knows it, but nobody is usually willing to talk about it.
- The bitter enemy. - The bitter thing that we have to destroy that we're all struggling with and it's like all around,
it's like fish can't see water, it's complexity. - Sure, yes. It's complexity.
- [Chris] Right? - That was very philosophical, (Chris chuckling) Very well said. - [Chris] And so if you look at it, yes, it is on the hardware side.
- Yes. - All these accelerators, all these software stack that go with the accelerator, all these, like, there's massive complexity over there.
You look at what's happening on the modeling side, massive amount of complexity. Like, things are changing all the time.
People are inventing. Turns out the research is not done, (chuckles) right? And so people wanna be able to move fast.
Transformers are amazing, but there's a ton of diversity even within transformers, and what's the next transformer, right?
And you look into serving. Also, huge amounts of complexity. It turns out that all the cloud providers, right,
have all their very weird but very cool hardware for networking and all this kinda stuff. And it's all very complicated. People aren't using that.
You look at classical serving, right, there's this whole world of people who know how to write
high-performance servers with zero-copy networking and, like, all this fancy asynchronous I/O,
and, like, all these fancy things in the serving community, very little that has pervaded
into the machine learning world, right? And why is that? Well, it's because, again, these systems have been built up over many years.
They haven't been rethought, there hasn't been a first principles approach to this. And so what Modular's doing is we're saying, "Okay,
we've built many of these things, right?" So I've worked on TensorFlow and TPUs and things like that. Other folks on our team have, like, worked on PyTorch Core.
We've worked on ONNX one time. We've worked on many of these other systems. And so built systems like the Apple accelerators
and all that kinda stuff, like our team is quite amazing. And so one of the things that roughly everybody
at Modular's grumpy about is that when you're working on one of these projects, you have a first order goal:
Get the hardware to work. Get the system to enable one more model. Get this product out the door. Enable the specific workload,
or make it solve this problem for this product team, right? And nobody's been given a chance
to actually do that step back. And so we, as an industry, we didn't take two steps forward. We took like 18 steps forward
in terms of all this really cool technology across compilers and systems and runtimes and heterogeneous computing, like all this kinda stuff.
And like, all this technology has been, you know, I wouldn't say beautifully designed, but it's been proven in different quadrants.
Like, you know, you look at Google with TPUs, massive, huge exif flops of compute strapped together
into machines that researchers are programming in Python in a notebook. That's huge. That's amazing. - That's amazing.
That's incredible. - Right, it's incredible. And so you look at the technology that goes into that, and the algorithms are actually quite general.
And so lots of other hardware out there and lots of other teams out there don't have the sophistication or the, maybe the years working on it,
or the budget, or whatever that Google does, right? And so they should be getting access to the same algorithms,
but they just don't have that, right? And so what Modular's doing, so we're saying, "Cool, this is not research anymore."
Like, we've built auto-tuning in many systems. We've built programming languages, right? And so like, have implemented C++, have implemented Swift,
have implemented many of these things. And so, you know, it's hard, but it's not research.
And you look at accelerators. Well, we know there's a bunch of different, weird kind of accelerators, but they actually cluster together, right?
And you look at GPUs. Well, there's a couple of major vendors of GPUs and they maybe don't always get along,
but their architectures are very similar. You look at CPUs. CPUs are still super important for the deployment side of things.
And you see new architectures coming out from all the cloud providers and things like this, and they're all super important to the world, right,
but they don't have the 30 years of development that the entrenched people do, right? And so what Modular can do is we're saying,
"Okay, all this complexity, like, it's not bad complexity, it's actually innovation, (chuckles) right?"
And so it's innovation that's happening and it's for good reasons, but I have sympathy for the poor software people, right?
I mean, again, I'm a generally software person too. I love hardware, but software people wanna build applications and products
and solutions that scale over many years. They don't wanna build a solution for one generation
of hardware with one vendor's tools, right? And because of this, they need something that scales with them.
They need something that works on cloud and mobile, right, because, you know, their product manager said, Hey,
I want it to have lower latency and it's better for personalization, or whatever they decide, right?
Products evolve. And so the challenge with the machine learning technology and the infrastructure we have today in the industry
is that it's all these point solutions. And because there are all these point solutions, it means that as your product evolves,
you have to like switch different technology stacks or switch to a different vendor. And what that does is that slows down progress.
- So basically a lot of the things we've developed in those little silos for machine learning tasks,
you want to make that the first class citizen of a general purpose programming language that can then be compiled
across all these kinds of hardware. - Well, so it's not really about a programming language. I mean, the programming language is a component of the mission, right?
And the mission is, or not literal, but our joking mission is "to save the world from terrible AI software."
- [Lex] Excellent. I love it. - Okay? (chuckles) - So, you know, if you look at this mission,
you need a syntax. So yeah, you need programming language, right? And like, we wouldn't have to build the programming language
if one existed, right? So if Python was already good enough, then cool, we would've just used it, right? We're not just doing very large scale,
expensive engineering projects for the sake of it, like, it's to solve a problem, right? It's also about accelerators.
It's also about exotic numerics and bfloat16 and matrix multiplication and convolutions
and like, this kinda stuff. Within the stack, there are things like kernel fusion.
That's a esoteric but really important thing that leads to much better performance and much more general research hackability together, right?
- And that's enabled by the ASICs. That's enabled by certain hardware. So it's like- - Well. - Where's the dance between,
I mean, there's several questions here. Like, how do you add- - Yep. - a piece of hardware to the stack if a new piece of- - Yeah. - like if I have this genius invention
of a specialized accelerator- - Yeah. - how do I add that to the Modular framework? And also how does Modular as a standard
start to define the kinds of hardware that should be developed? - Yeah, so let me take a step back
and talk about status quo, okay? - Yes. - And so if you go back to TensorFlow 1, PyTorch 1,
this kinda timeframe, and these have all evolved and gone way more complicated. So let's go back to the glorious simple days, right?
These things basically were CPUs and CUDA. And so what you do is you say, go do a dense layer.
And a dense layer has a matrix multiplication in it, right? And so when you say that, you say, go do this big operation, a matrix multiplication,
and if it's on a GPU, kick off a CUDA kernel. If it's on a CPU, go do like an Intel algorithm,
or something like that with an Intel MKL, okay? Now that's really cool if you're either Nvidia or Intel, right?
But then more hardware comes in, right? And on one access, you have more hardware coming in.
On the other hand, you have an explosion of innovation in AI. And so what happened with both TensorFlow and PyTorch is
that the explosion of innovation in AI has led to, it's not just about matrix multiplication and convolution.
These things have now like 2,000 different operators. And on the other hand, you have, I don't know how many pieces of hardware
there are out there. It's a lot, (chuckles) okay? It's not even hundreds. It's probably thousands, okay?
And across all of edge and across like, all the different things- - That are used at scale.
- [Chris] Yeah, exactly. I mean- - Also it's not just like a handful. - AI's everywhere. Yeah. - It's not a handful of TPU alternatives.
It's- - Correct. It's every phone, often with many different chips inside of it- - Right.
- from different vendors from... - Right. - Like, AI is everywhere. It's a thing, right?
- Why are they all making their own chips? Like, why is everybody making their own thing? - [Chris] Well, so-
- Is that a good thing, first of all? - So Chris's philosophy on hardware, right? - Yeah. - So my philosophy is
that there isn't one right solution, right? And so I think that, again,
we're at the end of Moore's law, specialization happens. - [Lex] Yeah. - If you're building, if you're training GPT-5,
you want some crazy super computer data center thingy. If you're making a smart camera that runs on batteries,
you want something that looks very different. If you're building a phone, you want something that looks very different. If you have something like a laptop,
you want something that looks maybe similar but a different scale, right? And so AI ends up touching all of our lives.
Robotics, right? And, like, lots of different things. And so as you look into this, these have different power envelopes.
There's different trade-offs in terms of the algorithms. There's new innovations and sparsity and other data formats and things like that.
And so hardware innovation, I think, is a really good thing, right? And what I'm interested in is unlocking that innovation.
There's also like analog and quantum and like all the really weird stuff, right? - Yeah.
- And so if somebody can come up with a chip that uses analog computing and it's 100x more power efficient,
think what that would mean in terms of the daily impact on the products we use, that'd be huge.
Now, if you're building an analog computer, you may not be a compiler specialist, right?
These are different skill sets, right? And so you can hire some compiler people if you're running a big company, maybe,
but it turns out these are really like exotic new generation of compilers. (chuckles)
Like, this is a different thing, right? So if you take a step back out and come back to what is the status quo, the status quo is that if you're Intel or you're Nvidia,
you keep up with the industry and you chase and, okay, there's 1,900 now, there's 2-000 now, there's 2,100.
And you have a huge team of people that are like trying to keep up and tune and optimize. And even when one of the big guys comes out
with a new generation of their chip, they have to go back and rewrite all these things, right? So really it's only powered by having hundreds of people
that are all, like, frantically trying to keep up. And what that does is that keeps out the little guys,
and sometimes they're not so little guys, the big guys that are also just not in those dominant positions.
And so what has been happening, and so you talk about the rise of new exotic, crazy accelerators is people have been trying to turn this
from a let's go write lots of special kernels problem into a compiler problem.
And so we, and I contributed to this as well, (chuckles) we as an industry went into a like, let's go make this compiler problem phase, let's call it.
And much of the industry is still in this phase, by the way. So I wouldn't say this phase is over. And so the idea is to say, look, okay,
what a compiler does is it provides a much more general, extensible hackable interface
for dealing with the general case, right? And so within machine learning algorithms, for example,
people figured out that, hey, if I do a matrix multiplication and I do a ReLU, right,
the classic activation function, it is way faster to do one passover the data
and then do the ReLU on the output where I'm writing out the data, 'cause ReLU is just a maximum operation, right, max at zero.
And so it's an amazing optimization. Take MathML, ReLU. Squished together in one operation, now I have MathML ReLU.
Well, wait a second. If I do that, now, I just went from having, you know, two operators to three.
But now I figure out, okay, well, there's a lot of activation functions. What about a leaky value? What about...
Like, a million things that are out there, right? And so as I start fusing these in, now I get permutations of all these algorithms, right?
And so what the compiler people said is they said, "Hey, well, cool. Well, I will go enumerate all the algorithms and I will enumerate all the pairs
and I will actually generate a kernel for you." And I think that this has been very, very useful for the industry.
This is one of the things that powers Google TPUs. PyTorch 2's, like, rolling out really cool compiler stuff
with Triton, this other technology, and things like this. And so the compiler people are kind of coming
into their fore and saying like, Awesome, this is a compiler problem. We'll compiler it. Here's the problem. (chuckles)
Not everybody's a compiler person. I love compiler people, trust me, right, but not everybody can or should be a compiler person.
It turns out that they're people that know analog computers really well, or they know some GPU
internal architecture thing really well, or they know some crazy sparse numeric interesting algorithm that is the cusp of research,
but they're not compiler people. And so one of the challenges with this new wave of technology trying to turn everything into a compiler,
'cause again, it has excluded a ton of people. And so you look at what does Mojo do, what does the Modular stack do
is brings programmability back into this world. Like, it enables, I wouldn't say normal people,
but like a new, you know, a different kind of delightful nerd that cares about numerics, or cares about hardware,
or cares about things like this, to be able to express that in the stack and extend the stack without having to actually go hack the compiler itself.
- So extend the stack on the algorithm side. - [Chris] Yeah. - And then on the hardware side.
- Yeah, so again, go back to, like, the simplest example of int, right? And so what both Swift and Mojo and other things
like this did is we said, okay, pull magic out of the compiler and put it in the standard library, right? And so what Modular's doing
with the engine that we're providing and like, this very deep technology stack, right, which goes into heterogeneous runtimes
and like a whole bunch of really cool, really cool things, this whole stack allows that stack to be extended and hacked
and changed by researchers and by hardware innovators and by people who know things that we don't know,
(chuckles) 'cause, you know, Modular has some smart people, but we don't have all the smart people it turns out, right?
- What are heterogeneous runtimes? - Yeah. So what is heterogeneous, right?
So heterogeneous just means many different kinds of things together. And so the simplest example
you might come up with is a CPU and a GPU. And so it's a simple heterogeneous computer to say,
I'll run my data loading and pre-processing and other algorithms on the CPU. And then once I get it into the right shape,
I shove it into the GPU. I do a lot of matrix multiplication and convolutions and things like this. And then I get it back out
and I do some reductions and summaries and they shove it across the wire, to across the network to another machine, right?
And so you've got now what are effectively two computers, a CPU and a GPU talking to each other,
working together in a heterogeneous system. But that was 10 years ago, (chuckles) okay?
You look at a modern cell phone. Modern cell phone, you've got CPUs, and they're not just CPUs,
there's like big.LITTLE CPUs and there's multiple different kinds of CPUs that are kind- - Yep. - of working together, they're multi-core.
You've got GPUs, you've got neural network accelerators, you've got dedicated hardware blocks for media,
so for video decode and jpeg decode and things like this. And so you've got this massively complicated system, and this isn't just cell phones.
Every laptop these days is doing the same thing. And all these blocks can run at the same time
and need to be choreographed, right? And so again, one of the cool things about machine learning
is it's moving things to like data flow graphs and higher level of abstractions and tensors and these things that it doesn't specify,
here's how to do the algorithm. It gives the system a lot more flexibility in terms of how to translate or map it
or compile it onto the system that you have. And so what you need, you know, the bottom-est part of the layer there is
a way for all these devices to talk to each other. And so this is one thing that, you know, I'm very passionate about.
I mean, you know, I'm a nerd, but all these machines and all these systems are effectively parallel computers
running at the same time, sending messages to each other. And so they're all fully asynchronous.
Well, this is actually a small version of the same problem you have in a data center, right? In a data center, you now have multiple different machines,
sometimes very specialized, sometimes with GPUs or TPUs in one node and sometimes with disks in other nodes.
And so you get a much larger scale heterogenous computer. And so what ends up happening is you have this, like,
multi-layer abstraction of hierarchical parallelism, hierarchical, asynchronous communication and making that,
again, my enemy, is complexity. By getting that away from being
different specialized systems at every different part of the stack and having more consistency and uniformity,
I think we can help lift the world and make it much simpler and actually get used. - Well, how do you leverage, like, the strengths of the different specialized systems?
So looking inside the smartphone, like there's what, like- - Yeah. - I don't know, five, six computers essentially
inside the smartphone? - Yeah. - How do you, without trying to minimize the explicit,
making it explicit, which computer is supposed to be used for which operation? - Yeah, so there's a pretty well-known algorithm,
and what you're doing is you're looking at two factors. You're looking at the factor of sending data from one thing to another, right,
'cause it takes time to get it from that side of the chip to that side of the chip and things like this. And then you're looking at what is the time it takes to do
an operation on a particular block. So take CPUs. CPUs are fully general. They can do anything, right?
But then you have a neural net accelerator that's really good at matrix multiplication, okay? And so you say, okay,
well, if my workload is all matrix multiplication, I start up, I send the data over the neural net thing,
it goes and does matrix multiplication. When it's done, it sends me back the result. All is good, right? And so the simplest thing is just saying,
do matrix operations over there, right? But then you realize you get a little bit more complicated because you can do matrix multiplication on a GPU,
you can do it on a neural net accelerator, you can do it on CPU, and they'll have different trade-offs and costs.
And it's not just matrix multiplication. And so what you actually look at is you look at, I have generally a graph of compute.
I wanna do a partitioning. I wanna look at the communication, the bisection bandwidth,
and like the overhead- - Overheads. - and the sending of all these different things and build a model for this and then decide, okay,
it's an optimization problem of where do I wanna place this compute? - So it's the old school theoretical computer science
problem of scheduling. - Yep. - And then, presumably it's possible to, somehow,
magically include auto-tune into this. - Absolutely, so I mean, in my opinion, this is an opinion,
not everybody would agree with this, but in my opinion, the world benefits from simple and predictable systems
at the bottom you can control. But then once you have a predictable execution layer,
you can build lots of different policies on top of it, right? And so one policy can be that the human programmer says,
do that here, do that here, do that here, do that here, and like, fully manually controls everything
and the systems should just do it, right? But then you quickly get in the mode of like, I don't wanna have to tell it to do it. (chuckles) - Yeah.
- And so the next logical step that people typically take is they write some terrible heuristic. "Oh, if it's a information location, do it over there.
or if it's floating point, do it on the GPU. If it's integer, do it on the CPU," like, something like that, right?
And then you then get into this mode of like, people care more and more and more, and you say, okay, well, let's actually, like, make the heuristic better.
Let's get into auto-tuning. Let's actually do a search of the space to decide,
well, what is actually better, right? Well, then you get into this problem where you realize this is not a small space.
This is a many-dimensional hyperdimensional space that you cannot exhaustively search.
So do you know of any algorithms that are good at searching very complicated spaces for... - Don't tell me you're gonna turn this
into a machine learning problem. - So then you turn into a machine learning problem, and then you have a space of genetic algorithms
and reinforcement learning and, like, all these concerns. - Can you include that into the stack, into the Modular stack?
- Yeah, yeah. And so- - Where does it sit? Where does it live? Is it separate thing or is it part of the compilation? - So you start from simple and predictable models.
And so you can have full control and you can have coarse grain knobs that, like, nudge systems so you don't have to do this.
But if you really care about getting the best, you know, the last ounce out of a problem, then you can use additional tools.
The cool thing is you don't wanna do this every time you run a model. You wanna figure out the right answer and then cache it.
(chuckles) And once you do that, you can say, okay, cool. Well, I can get up and running very quickly.
I can get good execution out of my system, I can decide if something's important,
and if it's important, I can go throw a bunch of machines at it and do a big, expensive search over the space using whatever technique I feel like,
it's really up to the problem. And then when I get the right answer, cool, I can just start using it, right?
And so you can get out of this, this trade-off between, okay, am I gonna like spend forever doing a thing
or do I get up and running quickly? And as a quality result, like, these are actually not in contention with each other
if the system's designed to scale. - You started and did a little bit of a whirlwind overview
of how you get the 35,000x speed up or more over Python.
Jeremy Howard did a really great presentation about sort of the basic, like, looking at the code, here's how you get the speed up.
Like you said, that's something probably developers can do for their own code to see how you can get
these gigantic speed ups. But can you maybe speak to the machine learning task in general?
How do you make some of this code fast, and specifics. Like, what would you say is the main bottleneck
for machine learning tasks? So are we talking about MathML matrix multiplication?
How do you make that fast? - So I mean, if you just look at the Python problem, right? You can say, how do I make Python faster?
And there's been a lot of people that have been working on the, okay, how do I make Python 2x faster, or 10x faster, or something like that, right?
And there've been a ton of projects in that vein, right? Mojo started from the, what can the hardware do?
Like, what is the limit of physics? What is the speed of light? - Yeah. What is the- - Yeah, yeah. - Like, how fast can this thing go? And then how do I express that,
right? - Yeah. - And so it wasn't anchored relatively on make Python a little bit faster.
It's saying, cool, I know what the hard work can do. Let's unlock that, right? Now when you- (Lex chuckling)
- Yeah, just say how gutsy that is to be in the meeting and as opposed to trying to see, how do we get the improvement?
It's like, what can the physics do? - I mean, maybe I'm a special kinda nerd, but you look at that, what is the limit of physics?
How fast can these things go, right? When you start looking at that, typically it ends up being a memory problem, right?
And so today, particularly with these specialized accelerators, the problem is that you can do a lot of math within them,
but you get bottleneck sending data back and forth to memory, whether it be local memory, or distant memory,
or disk, or whatever it is. And that bottleneck, particularly as the training sizes get large
as you start doing tons of inferences all over the place, like, that becomes a huge bottleneck for people, right?
So again, what happened is we went through a phase of many years where people took the special case and hand-tuned it and tweaked it and tricked it out.
And they knew exactly how the hardware worked and they knew the model and they made it fast, didn't generalize. (chuckles)
And so you can make, you know, ResNet-50, or AlexNet, or something, Inception v1, like, you can do that, right?
Because the models are small, they fit in your head, right? But as the models get bigger, more complicated,
as the machines get more complicated, it stops working, right? And so this is where things like kernel fusion come in.
So what is kernel fusion? This is this idea of saying, let's avoid going to memory and let's do that by building
a new hybrid kernel and a numerical algorithm
that actually keeps things in the accelerator instead of having to write it all the way out to memory, right?
What's happened with these accelerators now is you get multiple levels of memory. Like, in a GPU for example, you'll have global memory and local memory,
and, like, all these things. If you zoom way into how hardware works,
the register file is actually a memory. (chuckles) So the registers are like an L0 cache.
And so a lot of taking advantage of the hardware ends up being fully utilizing the full power
in all of its capability. And this has a number of problems, right? One of which is again, the complexity of disaster, right?
There's too much hardware. Even if you just say let's look at the chips from one line of vendor,
like Apple, or Intel, or whatever it is, each version of the chip comes out with new features
and they change things so that it takes more time or less to do different things. And you can't rewrite all the software
whenever a new chip comes out, right? And so this is where you need a much more scalable approach. And this is what Mojo and what the Modular stack provides is
it provides this infrastructure and the system for factoring all this complexity and then allowing people to express algorithms,
you talk about auto-tuning, for example, express algorithms in a more portable way
so that when a new chip comes out, you don't have to rewrite it all. So to me, like, you know, I kinda joke,
like, what is a compiler? Well, there's many ways to explain that. You convert thing A into thing B
and you convert source code to machine code. Like, you can talk about many, many things that compilers do,
but to me it's about a bag of tricks. It's about a system and a framework that you can hang complexity.
It's a system that can then generalize and it can work on problems that are bigger than fit in one human's head, (chuckles) right?
And so what that means, what a good stack and what the Modular stack provides is
the ability to walk up to it with a new problem and it'll generally work quite well.
And that's something that a lot of machine learning infrastructure and tools and technologies don't have.
Typical state-of-the-art today is you walk up, particularly if you're deploying, if you walk up with a new model, you try to push it through the converter
and the converter crashes, that's crazy. The state of ML tooling today is not anything
that a C programmer would ever accept, right? And it's always been this kind of flaky set of tooling
that's never been integrated well, and it's never worked together because it's not designed together.
It's built by different teams, it's built by different hardware vendors, it's built by different systems, it's built by different internet companies.
They're trying to solve their problems, right? And so that means that we get this fragmented,
terrible mess of complexity. - So I mean, the specifics of, and Jeremy showed this- - Yeah.
- there's the vectorized function, which I guess is built into Mojo?
- [Chris] Vectorized, as he showed, is built into the library. - Into the library, it's done on the library. - [Chris] Yep. - Vectorize, parallelize.
- [Chris] Yep. - Which vectorize is more low-level, parallelize is higher level. There's the tiling thing,
which is how he demonstrated the auto-tune, I think. - So think about this in, like, levels,
hierarchical levels of abstraction, right? If you zoom all the way into a compute problem,
you have one floating point number, right? And so then you say, okay, I can do things one at a time in an interpreter.
(chuckles) It's pretty slow, right? So I can get to doing one at a time in a compiler,
like in C. I can get to doing 4, or 8 or 16 at a time with vectors.
That's called vectorization. Then you can say, hey, I have a whole bunch of different...
You know, what a multi-core computer is, is it's basically a bunch of computers, right?
So they're all independent computers that they can talk to each other and they share memory. And so now what parallelize does, it says, okay,
run multiple instances on different computers. And now, they can all work together on Chrome, right? And so what you're doing is you're saying,
keep going out to the next level out. And as you do that, how do I take advantage of this?
So tiling is a memory optimization, right? It says, okay, let's make sure that we're keeping the data
close to the compute part of the problem instead of sending it all back and forth through memory every time I load a block.
- And the size of the block, size is, that's how you get to the auto-tune to make sure it's optimized. - Right, yeah.
Well, so all of these, the details matter so much to get good performance. This is another funny thing about machine learning
and high-performance computing that is very different than C compilers we all grew up with where, you know,
if you get a new version of GCC, or a new version of Clang, or something like that, you know, maybe something will go 1% faster, right?
And so compiler engine will work really, really, really hard to get half a percent out of your C code, something like that.
But when you're talking about an accelerator, or an AI application, or you're talking about these kinds of algorithms,
now these are things people used to write in Fortran, for example, right? If you get it wrong, it's not 5% or 1%,
it could be 2x or 10x, (chuckles) right? If you think about it, you really want to make use of the full memory
you have, the cache, for example. But if you use too much space, it doesn't fit in the cache, now you're gonna be thrashing
all the way back out to main memory. And these can be 2x, 10x major performance differences.
And so this is where getting these magic numbers and these things right is really actually quite important.
Mojo vs CPython
- So you mentioned that Mojo is a superset of Python.
Can you run Python code as if it's Mojo code?
- Yes, yes, (Lex chuckling) and this has two sides of it. So Mojo's not done yet. So I'll give you a disclaimer.
Mojo's not done yet, but already we see people that take small pieces of Python code, move it over, they don't change it,
and you can get 12x speed ups. Like, somebody was just tweeting about that yesterday, which is pretty cool, right?
And again, interpreters, compilers, right? And so without changing any code, without... Also, this is not JIT compiling or doing anything fancy.
This is just basic stuff, move it straight over. Now Mojo will continue to grow out and as it grows out,
it will have more and more and more features and our North Star's to be a full superset of Python.
And so you can bring over, basically, arbitrary Python code and have it just work. It may not always be 12x faster,
but it should be at least as fast and way faster in many cases, is the goal, right?
Now, it'll take time to do that. And Python is a complicated language. There's not just the obvious things, but there's also non-obvious things that are complicated.
Like, we have to be able to talk to CPython packages, to talk to the CPI, and there's a bunch of pieces to this.
- So you have to, I mean, just to make explicit the obvious that may not be so obvious until you think about it.
So, you know, to run Python code, that means you have to run all the Python packages and libraries.
- [Chris] Yeah, yeah. - So that means what? What's the relationship between Mojo and CPython,
the interpreter that's- - Yep. - presumably would be tasked with getting those packages to work?
- Yep, so in the fullness of time, Mojo will solve for all the problems and you'll be able to move Python packages
over and run them in Mojo. - [Lex] Without the CPython. - Without Cpython, someday,
right, not today, but someday. - Yeah. And that'll be a beautiful day because then you'll get a whole bunch of advantages
and you'll get massive speedups and things like this. - But you can do that one at a time, right? You can move packages one at a time. - Exactly,
but we're not willing to wait for that. (chuckles) Python is too important. The ecosystem is too broad.
We wanna both be able to build Mojo out, we also wanna do it the right way without time, like, without intense time pressure.
We're obviously moving fast, but. And so what we do is we say, okay, well, let's make it so you can import
an arbitrary existing package, arbitrary, including, like,
you write your own on your local disk (chuckles) or whatever. It's not like a standard, like an arbitrary package,
and import that using CPython because CPython already runs all the packages, right?
And so what we do is we built an integration layer where we can actually use Cpython,
again, I'm practical, and to actually just load and use all the existing packages as they are.
The downside of that is you don't get the benefits of Mojo for those packages, right? And so they'll run as fast, as they do in the traditional CPython way,
but what that does is that gives you an incremental migration path. And so if you say, hey, cool, well, here's a,
you know, the Python ecosystem is vast. I want all of it to just work, but there's certain things that are really important.
And so if I'm doing weather forecasting or something, (chuckles) well, I wanna be able to load all the data,
I wanna be able to work with it, and then I have my own crazy algorithm inside of it. Well, normally I'd write that in C++.
If I can write in Mojo and have one system that scales, well, that's way easier to work with. - Is it hard to do that,
to have that layer that's running CPython? Because is there some communication back and forth?
- Yes, it's complicated. I mean, this is what we do. So, I mean, we make it look easy, but it is complicated.
But what we do is we use the CPython existing interpreter. So it's running its own bike codes,
and that's how it provides full compatibility. And then it gives us CPython objects,
and we use those objects as is. And so that way we're fully compatible with all the CPython objects and all the, you know,
it's not just the Python part, it's also the C packages, the C libraries underneath them, because they're often hybrid.
And so we can fully run and we're fully compatible with all that. And the way we do that is that we have to play by their rules, right?
And so we keep objects in that representation when they're coming from that world. - What's the representation that's being used?
- In memory. We'd have to know a lot about how the CPython interpreter works. It has, for example, reference counting,
but also different rules on how to pass pointers around, and things like this, super low-level fiddly.
And it's not like Python. It's like how the interpreter works, okay? And so that gets all exposed out,
and then you have to define wrappers around the low-level C code, right? And so what this means is you have to know not only C,
which is a different role from Python, obviously, not only Python- - [Lex] But the wrappers.
- but the interpreter and the wrappers and the implementation details and the conventions. And it's just this reall complicated mess.
And when you do that, now suddenly you have a debugger that debugs Python, they can't step into C code, right?
So you have this two-world problem, right? And so by pulling this all into Mojo,
what you get is you get one world. You get the ability to say, cool, I have un-typed, very dynamic, beautiful, simple code.
Okay, I care about performance, for whatever reason, right? There's lots of reasons you might care.
And so then you add types, you can parallelize things. You can vectorize things, you can use these techniques, which are general techniques to solve a problem.
And then you can do that by staying in the system. And if you have that one Python package
that's really important to you, you can move it to Mojo. You get massive performance benefits on that and other advantages.
You know, if you like static types, it's nice if they're enforced. Some people like that, right, rather than being hints.
So there's other advantages too. And then you can do that incrementally as you go.
- So one different perspective on this would be why Mojo
instead of making CPython faster, redesigning CPython. - Yeah, well, I mean,
you could argue Mojo is redesigning CPython, but why not make CPython faster
and better and other things like that, there's lots of people working on that. So actually there's a team at Microsoft
that is really improving... I think CPython 3.11 came out in October
or something like that, and it was, you know, 15% faster, 20% faster across the board,
which is pretty huge given how mature Python is and things like this. And so that's awesome. I love it.
Doesn't run on GPU. (chuckles) It doesn't do AI stuff. Like, it doesn't do vectors, doesn't do things.
20 percent's good. 35,000 times is better, right? So like, they're definitely...
I'm a huge fan of that work, by the way, and it composes well with what we're doing. It's not like we're fighting or anything like that.
It's actually just, it's goodness for the world, but it's just a different path, right? And again, we're not working forwards
from making Python a little bit better. We're working backwards from what is the limit of physics? - What's the process of importing Python code to Mojo?
Is there... What's involved in that process? - Yeah. - Is there tooling for that?
- Not yet. So we're missing some basic features right now. And so we're continuing to drop out new features,
like, on a weekly basis, but, you know, at the fullness of time, give us a year and a half, maybe two years.
- Is it an automatable process? - So when we're ready, it'll be very automatable, yes.
- Is it automatable? Like, is it possible to automate, in the general case of Python- - Yeah.
- to Mojo conversion, and you're saying it's possible. - Well, so, and this is why, I mean, among other reasons why we use tabs,
(chuckles) right? - Yes. - [Chris] So first of all, by being a superset- - Yep. - it's like C versus C++.
Can you move C code to C++? Yeah, right? - Yes. - And you can move C code to C++,
and then you can adopt classes, you can add adopt templates, you can adopt other references
or whatever C++ features you want. After you move C code to C++, like, you can't use templates in C, right?
And so if you leave it at C, fine. You can't use the cool features, but it still works, right? And C and C++ good work together.
And so that's the analogy, right? Now here, right,
there's not a Python is bad and Mojo is good, (chuckles) right? Mojo just gives you superpowers, right?
And so if you wanna stay with Python, that's cool, but the tooling should be actually very beautiful and simple
because we're doing the hard work of defining a superset. - Right. So you're right. So there's several things to say there,
but also the conversion tooling should probably give you hints as to, like, how you can improve the code?
- Yeah, exactly. Once you're in the new world, then you can build all kinds of cool tools to say like, hey, should you adopt this feature?
And we haven't built those tools yet, but I fully expect those tools will exist. And then you can like, you know,
quote, unquote, "modernize your code," or however you wanna look at it, right? So I mean one of the things that I think is really interesting about Mojo is
that there have been a lot of projects to improve Python over the years.
Everything from, you know, getting Python run on the Java virtual machine, PyPy, which is a JIT compiler.
There's tons of these projects out there that have been working on improving Python in various ways.
They fall into one or two camps. So PyPy is a great example of a camp that is trying to be compatible with Python.
Even there, not really. Doesn't work with all the C packages and stuff like that, but they're trying to be compatible with Python.
There's also another category of these things where they're saying, well, Python is too complicated and,
you know, I'm gonna cheat on the edges and at, you know, like integers in Python can be an arbitrary size integer.
Like if you care about it fitting in a, going fast in a register in a computer, that's really annoying, right?
And so you can choose two pass on that, right? You can say, well, people don't really use big integers that often,
therefore I'm gonna just not do it and it'll be fine, not a Python superset. - Yeah.
- (chuckles) Or you can do the hard thing and say, okay, this is Python, and you can't be a superset of Python
without being a superset of Python. And that's a really hard technical problem, but it's,
in my opinion, worth it, right? And it's worth it because it's not about any one package. It's about this ecosystem.
It's about what Python means for the world. And it also means we don't wanna repeat the Python 2 to Python 3 transition.
Like we want people to be able to adopt this stuff quickly. And so by doing that work, we can help lift people.
- Yeah, the challenge, it's really interesting, technical, philosophical challenge of really making a language
a superset of another language. It's breaking my brain a little bit.
- Well, it paints you into corners. So again, I'm very happy with Python, right? So all joking aside,
I think that the indentation thing is not the actual important part of the problem. - [Lex] Yes. (Chris chuckling)
- Right? But the fact that Python has amazing dynamic metaprogramming features and they translate to beautiful static metaprogramming features,
I think is profound I think that's huge, right? And so Python, I've talked with Guido about this, it's like,
it was not designed to do what we're doing. That was not the reason they built it this way, but because they really cared and they were very thoughtful
about how they designed the language, it scales very elegantly in this space. But if you look at other languages,
for example, C and C++, right, if you're building a superset,
you get stuck with the design decisions of the subset, right?
And so, you know, C++ is way more complicated because of C in the legacy than it would've been
if they would've theoretically designed a from scratch thing. And there's lots of people right now
that are trying to make C++ better and recent syntax C++, it's gonna be great, we'll just change all the syntax.
But if you do that, now suddenly you have zero packages, you don't have compatibility.
- If you could just linger on that, what are the biggest challenges of keeping that superset status?
What are the things you're struggling with? Does it all boiled down to having a big integer? - No, I mean, it's-
- What are the other things like? - Usually it's the long tail weird things. So let me give you a war story.
- [Lex] Okay. - So war story in the space is you go away... Back in time, project I worked on is called Clang.
Clang, what it is a C++ parser, right? And when I started working on Clang,
it must have been like 2006 or something, less, or 2007 something, 2006 when I first started working on it, right?
It's funny how time flies. - [Lex] Yeah, yeah. - I started that project and I'm like, okay,
well, I wanna build a C parser, C++ parser for LVM?
It's gonna be the... GCC is yucky. You know, this is me in earlier times.
It's yucky, it's unprincipled, it has all these weird features, like all these bugs, like it's yucky.
So I'm gonna build a standard compliant C and C++ parser. It's gonna be beautiful, it'll be amazing, well-engineered,
all the cool things an engineer wants to do. And so I started implementing and building it out and building it out and building it out. And then I got to include standard io.h,
and all of the headers in the world use all the GCC stuff, (chuckles) okay? - Yeah.
- And so, again, come back away from theory back to reality, right?
I was at a fork on the road. I could have built an amazingly beautiful academic thing that nobody would ever use
or I could say, well, it's yucky in various ways. All these design mistakes, accents of history, the legacy.
At that point, GCC was like over 20 years old, which, by the way- - Yeah. - now, LLVM's over 20 years old, (laughs) right?
And so it's funny how- - Yep. - time catches up to you, right? And so you say, okay, well, what is easier, right?
I mean, as an engineer, it's actually much easier for me to go implement long tail compatibility weird features,
even if they're distasteful and just do the hard work and like figure it out, reverse engineer it,
understand what it is, write a bunch of test cases, like, try to understand the behavior. It's way easier to do all that work as an engineer
than it is to go talk to all C programmers and argue with them and try to get them to rewrite their code, right? - Yeah.
- And- - [Lex] 'Cause that breaks a lot more things. - Yeah. The reality is like nobody actually even understands
how the code works 'cause it was written by the person who quit 10 years ago, (chuckles) right?
And so this software is kind of frustrating that way, but it's, that's how the world works,
right? - Yeah. Unfortunately, it can never be this perfect, beautiful thing. - Well, there are occasions
in which you get to build, like, you know, you invent a new data structure or something like that, or there's this beautiful algorithm that's just like,
makes you super happy, and I love that moment. But when you're working with people- - Yeah. - and you're working with code and dusty deck code bases
and things like this, right, it's not about what's theoretically beautiful, it's about what's practical, what's real,
what people will actually use. And I don't meet a lot of people that say, I wanna rewrite all my code just for the sake of it.
- By the way, there could be interesting possibilities and we'll probably talk about it where AI can help rewrite some code. That might be farther out feature,
but it's a really interesting one, how that could create more- - Yeah, yeah. - be a tool in the battle against this monster of complexity
that you mentioned. - Yeah. - You mentioned Guido, the benevolent dictator for life of Python.
Guido van Rossum
What does he think about Mojo? Have you talked to him much about it? - I have talked with him about it. He found it very interesting.
We actually talked with before it launched, and so he was aware of it before it went public. I have a ton of respect for Guido
for a bunch of different reasons. You talk about walrus operator and, like, Guido's pretty amazing in terms of steering
such a huge and diverse community and, like, driving it forward.
And I think Python is what it is thanks to him, right? And so to me it was really important
starting to work on Mojo to get his feedback and get his input and get his eyes on this, right?
Now a lot of what Guido was and is I think concerned about is,
how do we not fragment the community? - [Lex] Yeah. - We don't want a Python 2 to Python 3 thing. Like, that was really painful for everybody involved.
And so we spent quite a bit of time talking about that. And some of the tricks I learned from Swift, for example, so in the migration from Swift,
we managed to, like, not just convert Objective-C into a slightly prettier Objective-C, which we did,
we then converted, not entirely, but almost an entire community to a completely different language, right?
And so there's a bunch of tricks that you learn along the way that are directly relevant to what we do. And so this is where, for example,
you leverage CPython while bringing up the new thing. Like, that approach is, I think,
proven and comes from experience. And so Guido's very interested in like, okay, cool.
Like, I think that Python is really his legacy, it's his baby. I have tons of respect for that.
Incidentally, I see Mojo as a member of the Python family. I'm not trying to take Python from Guido and from the Python community.
And so to me it's really important that we're a good member of that community.
I think that, again, you would have to ask Guido this, but I think that he was very interested in this notion of like, cool Python gets beaten up for being slow.
Maybe there's a path out of that, right? And that, you know, if the future is Python, right,
I mean, look at the far outside case on this, right?
And I'm not saying this is Guido's perspective, but, you know, there's this path of saying like, okay, well, suddenly Python can suddenly go all the places
it's never been able to go before, right? And that means that Python can go even further and can have even more impact on the world.
- So in some sense, Mojo could be seen as Python 4.0.
- I would not say that. I think that would drive a lot of people really crazy. - Because of the PTSD of the 3.0, 2.0.
- I'm willing to annoy people about Emacs versus Vim or- - Not that one. - [Chris] Versus spaces. - Not that one. - I don't know. That might be a little bit far even for me.
Like, my skin may not be that thick. - But the point is the step to being a superset and allowing all of these capabilities,
I think is the evolution of a language. It feels like an evolution of a language.
So he's interested by the ideas that you're playing with, but also concerned about the fragmentation.
So what are the ideas you've learned? What are you thinking about? How do we avoid fragmenting the community
where the Pythonistas and the,
I don't know what to call the Mojo people. - [Chris] Mojicians. - The mojicians, I like it. - [Chris] There you go.
- Can coexist happily and share code and basically just have these big code bases
that are using Cpython and more and more moving towards Mojo. - Yeah. Yeah.
Well, so again, these are lessons I learned from Swift. And here, we face very similar problems, right? In Swift, you have Objective-C, super dynamic.
They're very different syntax, (chuckles) right? But you're talking to people who have large scale code bases.
I mean, Apple's got the biggest, largest scale code base of Objective-C code, right? And so, you know, none of the companies,
none of the other iOS developers, none of the other developers want to rewrite everything all at once. And so you wanna be able to adopt things piece at a time.
And so a thing that I found that worked very well in the Swift community was saying, okay, cool, and this is when Swift was very young, and you say, okay,
you have a million line of code Objective-C app. Don't rewrite it all, but when you implement a new feature,
go implement that new class using Swift, right? And so now this turns out is
a very wonderful thing for an app developer, but it's a huge challenge for the compiler team
and the systems people that are implementing this, right? And this comes back to what is this trade-off between doing
the hard thing that enables scale versus doing the theoretically pure and ideal thing, right?
And so Swift had adopted and built a lot of different machinery to deeply integrate with the Objective-C runtime.
And we're doing the same thing with Python right now. What happened in the case of Swift is that Swift's language
got more and more and more mature over time, right? And incidentally, Mojo is a much simpler language than Swift in many ways.
And so I think that Mojo will develop way faster than Swift for a variety of reasons. But as the language gets more mature and parallel with that,
you have new people starting new projects, right? And so if when the language is mature
and somebody's starting a new project, that's when they say, okay, cool, I'm not dealing with a million lines of code. I'll just start and use the new thing for my whole stack.
Now the problem is, again, you come back to we're communities and we're people that work together.
You build new subsystem or a new feature or a new thing in Swift, or you build a new thing in Mojo,
then you want it to be end up being used on the other side, (chuckles) right? And so then you need to work on integration
back the other way. And so it's not just Mojo talking to Python, it's also Python talking to Mojo, right?
And so what I would love to see, I don't wanna see this next month, right, but what I wanna see over the course of time is I would love
to see people that are building these packages, like, you know, NumPy or, you know, TensorFlow or what, you know,
these packages that are half Python, half C++. And if you say, okay, cool,
I want to get out of this Python C++ world into a unified world and so I can move to Mojo,
but I can't give up all my Python clients 'cause they're like, these levers get used by everybody
and they're not all gonna switch every, all, you know, all at once and maybe never, right?
Well, so the way we should do that is we should vend Python interfaces to the Mojo types.
And that's what we did in Swift and worked great. I mean, it was a huge implementation challenge for the compiler people, right?
But there's only a dozen of those compiler people and there are millions of users. And so it's a very expensive, capital-intensive,
like, skillset intensive problem. But once you solve that problem, it really helps adoption and it really helps the community
progressively adopt technologies. And so I think that this approach will work quite well with the Python and the Mojo world.
- So for a package, port it to Mojo, and then create a Python interface. - [Chris] Yep.
Mojo vs PyTorch vs TensorFlow
- So when you're on these packages, NumPy, PyTorch, TensorFlow. - Yeah. - How do they play nicely together?
So is Mojo supposed to be... Let's talk about the machine learning ones.
Is Mojo kind of visioned to replace PyTorch, TensorFlow to incorporate it?
What's the relationship in this? - All right, so take a step back. So I wear many hats. (chuckles)
So you're angling it on the Mojo side. Mojo's a programming language. - Yes. - And so it can help solve
the C, C++ Python feud that's happening. - The fire emoji got me. I'm sorry. We should be talking Modular. Yes, yes.
- Yes, okay. So the fire emoji is amazing. I love it. It's a big deal.
The other side of this is the fire emoji is in service of solving some big AI problems, right? - Yes.
- And so the big AI problems are, again, this fragmentation, this hardware nightmare, this explosion of new potential,
but it's not getting felt by the industry, right? And so when you look at, how does the Modular engine help tens and PyTorch, right,
it's not replacing them, right? In fact, when I talk to people, again, they don't like to rewrite all their code.
You have people that are using a bunch of PyTorch, a bunch of TensorFlow. They have models that they've been building
over the course of many years, right? And when I talk to them, there's a few exceptions, but generally they don't wanna rewrite
all their code, right? And so what we're doing is we're saying, "Okay, well, you don't have to rewrite all your code."
What happens is the Modular engine goes in there and goes underneath TensorFlow and PyTorch. It's fully compatible and it just provides
better performance, better predictability, better tooling. It's a better experience that helps lift TensorFlow
and PyTorch and make them even better. I love Python, I love TensorFlow, I love PyTorch, right?
This is about making the world better because we need AI to go further. - But if I have a process that trains a model
and I have a process that performs inference on that model and I have the model itself,
what should I do with that in the long arc of history in terms of if I use PyTorch to train it.
Should I rewrite stuff in Mojo if I care about performance? - Oh, so I mean, again, it depends.
So if you care about performance, then writing it in Mojo is gonna be way better than writing in Python. But if you look at LLM companies, for example,
so you look at Open AI, rumored, and you look at many of the other folks that are working on many of these LLMs
and other like innovative machine learning models, on the one hand they're innovating in the data collection
and the model, billions of parameters, and the model architecture and the RLHF and the,
like all the cool things that people are talking about. But on the other hand, they're spending a lot of time writing CUDA curls, right?
And so you say, wait a second, how much faster could all this progress go if they were not having to hand write all these CUDA curls, right?
And so there are a few technologies that are out there, and people have been working on this problem for a while
and they're trying to solve subsets of the problem, again, kinda fragmenting the space. And so what Mojo provides for these kinds of companies is
the ability to say, cool, I can have a unifying theory, right? And again, the better together, the unifying theory,
the two-world problem, or the three-world problem, or the N-world problem, like, this is the thing that is slowing people down.
And so as we help solve this problem, I think it'll be very helpful for making this whole cycle go faster.
Swift programming language
- So obviously we've talked about the transition from Objective-C to Swift. You've designed this programming language,
and you've also talked quite a bit about the use of Swift for machine learning context.
Why have you decided to move away from maybe an intense focus on Swift
for the machine learning context versus sort of designing a new programming language that happens to be a superset?
- You're saying this is an irrational set of life choices I make or what? (chuckles) (Lex laughing) - Did you go to the desert and did you meditate on it?
Okay, all right. No, it was bold. It was bold and needed and I think, I mean,
it's just bold and sometimes to take those leaps, it's a difficult leap to take. - Yeah. Well, so, okay. I mean, I think there's a couple of different things.
So actually I left to Apple back in 2017, like January, 2017. So it's been a number of years that I left Apple.
And the reason I left Apple was to do AI, okay?
So, and again, I won't comment on Apple and AI, but at the time, right,
I wanted to get into and understand the technology, understand the applications, the workloads. And so I was like, okay,
I'm gonna go dive deep into Applied and AI, and then the technology underneath it, right?
I found myself at Google. - And that was like when TPUs were waking up. - Yep, exactly. - And so I found myself at Google and Jeff Dean,
who's a rockstar as you know, right? And in 2017, TensorFlow's, like,
really taking off and doing incredible things. And I was attracted to Google to help them with the TPUs, right?
And TPUs are an innovative hardware accelerator platform, have now I mean I think proven massive scale
and like done incredible things, right? And so one of the things that this led into is a bunch
of different projects, which I'll skip over, right? One of which was this Swift for TensorFlow project, right?
And so that project was a research project. And so the idea of that is say, okay,
well, let's look at innovative new programming models where we can get a fast programming language,
we can get automatic differentiation into the language. Let's push the boundaries of these things in a research setting, right?
Now, that project I think lasted two, three years. There's some really cool outcomes of that.
So one of the things that's really interesting is I published a talk at an LLVM conference in 2018,
again, this seems like so long ago, about graph program abstraction, which is basically the thing that's in PyTorch 2.
And so PyTorch 2 with all this DynamoRIO thing, it's all about this graph program abstraction thing from Python bike codes.
And so a lot of the research that was done ended up pursuing and going out through the industry and influencing things.
And I think it's super exciting and awesome to see that, but the Swift for TensorFlow project itself did not work out super well.
And so there's a couple of different problems with that. One of which is that, you may have noticed,
Swift is not Python. (chuckles) There's a few people that write Python code.
- [Lex] Yes. - And so it turns out that all of ML is pretty happy with Python. - It's actually a problem
that other programming languages have as well, that they're not Python. We'll probably maybe briefly talk about Julia,
was a very interesting, beautiful programming language, but it's not Python. - Exactly.
And so like if you're saying, I'm gonna solve a machine learning problem where all the programmers are Python programmers.
- [Lex] Yeah. - And you say the first thing you have to do is switch to a different language, well, your new thing may be good or bad or whatever,
but if it's a new thing, the adoption barrier is massive less. - It's still possible.
- Still possible, yeah, absolutely. The world changes and evolves and there's definitely room for new and good ideas, but it just makes it so much harder, right?
And so lesson learned, Swift is not Python, and people are not always in search of, like,
learning a new thing for the sake of learning a new thing. And if you wanna be compatible with all the world's code, turns out meet the world where it is, right?
Second thing is that, you know, a lesson learned is that Swift is a very fast and efficient language, kind of like Mojo,
but a different take on it still, really worked well with eager mode.
And so eager mode is something that PyTorch does, and it proved out really well, and it enables really expressive and dynamic
and easy to debug programming. TensorFlow at the time was not set up for that, let's say.
That was not... - [Lex] The timing is also important in this world. - Yeah, yeah. And TensorFlow is a good thing and it has many, many strengths,
but you could say Swift for TensorFlow is a good idea, except for the Swift and except for the TensorFlow part.
(chuckles) - Swift because it's not Python and TensorFlow because it- - [Chris] It wasn't set up for eager mode at the time, yeah.
- It was 1.0. - Exactly. And so one of the things about that is that in the context of it being a research project,
I'm very happy with the fact that we built a lot of really cool technology. We learned a lot of things.
I think the ideas went on to have influence in other systems, like PyTorch. A few people use that I hear, right? And so I think that's super cool.
And for me personally, I learned so much from it, right? And I think a lot of the engineers that worked on it also learned a tremendous amount.
And so, you know, I think that that's just really exciting to see. And, you know, I'm sorry that the project didn't work out.
I wish it did, of course, right, but, you know, it's a research project.
And so you're there to learn from it. - Well, it's interesting to think about the evolution of programming
Julia programming language
as we come up with these whole new set of algorithms in machine learning, in artificial intelligence.
And what's going to win out is it could be a new programming language. It could be- - Yeah.
- I mean, I just mentioned Julia. I think there's a lot of ideas
behind Julia that Mojo shares. What are your thoughts about Julia in general?
- So I will have to say that when we launched Mojo, one of the biggest things I didn't predict
was the response from the Julia community. And so I was not, I mean, I've,
okay, lemme take a step back. I've known the Julia folks for a really long time. They're an adopter of LLVM a long time ago.
They've been pushing state-of-the-art in a bunch of different ways. Julia's a really cool system.
I had always thought of Julia as being mostly a scientific computing focused environment, right?
And I thought that was its focus. I neglected to understand that one of their missions is
to, like, help make Python work end-to-end. (chuckles) And so I think that was my error for not understanding that.
And so I could have been maybe more sensitive to that, but there's major differences between what Mojo's doing and what Julia's doing.
So as you say, Julia is not Python, right? And so one of the things that a lot
of the Julia people came out and said is like, "Okay, well, if we put a ton of more energy into,
ton more money or in engineering or whatever into Julia, maybe that would be better than starting Mojo, right?"
Well, I mean, maybe that's true, but it still wouldn't make Julia into Python. (chuckles)
So if you worked backwards from the goal of, let's build something for Python programmers without requiring them to relearn syntax,
then Julia just isn't there, right? I mean, that's a different thing, right? And so if you anchor on, I love Julia,
and I want Julia to go further, then you can look at it from a different lens, but the lens we were coming at was,
Hey, everybody is using Python. The syntax isn't broken. Let's take what's great about Python
and make it even better. And so it was just a different starting point. So I think Julie's a great language. The community's a lovely community.
They're doing really cool stuff, but it's just a different, it's slightly different angle. - But it does seem that Python is quite sticky.
Is there some philosophical, almost thing you could say about why Python,
by many measures, seems to be the most popular programming language in the world? - Well, I can tell you things I love about it.
Maybe that's one way to answer the question, right? So huge package ecosystem, super lightweight and easy to integrate.
It has very low startup time, right? - [Lex] So what's startup time? You mean like learning curve or what?
- Yeah, so if you look at certain other languages, you say like, go, and it just takes a,
like Java, for example, it takes a long time to JIT compile all the things and then the VM starts up
and the garbage (indistinct) kicks in and then it revs its engines and then it can plow through a lot of internet stuff or whatever, right?
Python is like scripting. Like it just goes, right? - Yeah. - Python has a very low compile time.
Like, so you're not sitting there waiting. Python integrates in a notebooks in a very elegant way that makes exploration super interactive
and it's awesome, right? Python is also, it's like almost the glue of computing.
Because it has such a simple object representation, a lot of things plug into it.
That dynamic metaprogramming thing we were talking about, also enables really expressive and beautiful APIs, right?
So there's lots of reasons that you can look at, technical things the Python has done and say, like,
okay, wow, this is actually a pretty amazing thing. And any one of those you can neglect, people will all just talk about indentation
(chuckles) and ignore like the fundamental things. But then you also look at the community side, right?
So Python owns machine learning. Machine learning's pretty big. - Yeah, and it's growing. - And it's growing, right?
And it's growing in importance, right? And so- - And there's a reputation of prestige to machine learning to where like if you're a new programmer,
you're thinking about, like, which program and language do I use? Well, I should probably care about machine learning,
therefore let me try Python, and kinda builds and builds and builds. - And even go back before that.
Like, my kids learned Python, right, not because I'm telling 'em to learn Python, but because- - Were they rebelling
against you or what? - Oh, no, no. Well, they they also learn Scratch, right, and things like this too, but it's because Python is taught everywhere, right?
Because it's easy to learn, right? And because it's pervasive, right? And there's- - Back in my day, we learned Java and C++.
- [Chris] Yeah, well. - Well, uphill both directions, but yes. I guess Python- - Yeah. - is the main language
of teaching software engineering schools now. - Yeah, well, and if you look at this, there's these growth cycles, right?
If you look at what causes things to become popular and then gain in popularity, there's reinforcing feedback loops and things like this.
And I think Python has done, again, the whole community has done a really good job of building those growth loops and help propel the ecosystem.
And I think that, again, you look at what you can get done with just a few lines of code, it's amazing. - So this kinda self-building loop is interesting
Switching programming languages
to understand because when you look at Mojo, what it stands for some of the features,
it seems sort of clear that this is a good direction for programming languages
to evolve in the machine learning community, but it's still not obvious that it will because of this,
whatever the engine of popularity of virality. Is there something you could speak to, like,
how do you get people to switch? - Yeah, well, I mean, I think that the viral growth loop
is to switch people to Unicode. - [Lex] Yes. - I think the Unicode file extensions are what I'm betting on. I think that's gonna be the thing.
- Yeah. (Chris chuckling) - Tell the kids that you could use the fire emoji and they'd be like, what? - Exactly, exactly.
(Lex chuckling) Well, in all seriousness, like, I mean, I think there's really, I'll give you two opposite answers.
One is, I hope if it's useful, if it solves problems, and if people care about those problems being solved,
they'll adopt the tech, right? That's kinda the simple answer. And when you're looking to get tech adopted,
the question is, is it solving an important problem people need solved, and is the adoption cost low enough that they're willing
to make the switch and cut over and do the pain upfront so that they can actually do it, right?
And so hopefully Mojo will be that for a bunch of people. And, you know, people building these hybrid packages are suffering.
It is really painful. And so I think that we have a good shot of helping people, but the other side is like,
it's okay if people don't use Mojo. Like, it's not my job to say like, everybody should do this. Like, I'm not saying Python is bad.
Like, I hope Python, CPython, like, all these implementations 'cause Python ecosystems, not just CPython, it's also a bunch of different implementations
with different trade-offs. And this ecosystem is really powerful and exciting as are other programming languages.
It's not like type script or something is gonna go away, right? And so there's not a winner-take-all thing.
And so I hope that Mojo's exciting and useful to people, but if it's not, that's also fine. - But I also wonder what the use case
for why you should try Mojo would be. So practically speaking- - [Chris] Yeah.
- it seems like, so there's entertainment. There's the dopamine hit of saying, holy,
this is 10 times faster. This little piece of code is 10 times faster in Mojo.
- [Chris] Outta the box before you get to 35,000. - Exactly, I mean, just even that, I mean,
that's the dopamine hit that every programmer sorta dreams of is the optimization.
It's also the drug that can pull you in and have you waste way too much of your life
optimizing and over optimizing, right? But so what do you see would be, like, common?
It's very hard to predict, of course, but, you know, if you look 10 years from now and Mojo's super successful.
- [Chris] Yeah. - What do you think would be the thing where people like try and then use it regularly
and it kinda grows and grows and grows and grows? - Well, so you talked about dopamine hit. And so one, again, humans are not one thing.
And some people love rewriting their code and learning new things and throwing themselves in the deep end and trying out a new thing.
In my experience, most people, they're too busy. They have other things going on.
By number, most people don't want like this. I wanna rewrite all my code.
But (chuckles) even those people, the two busy people, the people that don't actually care about the language,
that just care about getting stuff done, those people do like learning new things, right? - [Lex] Yeah.
- And so you talk about the dopamine rush of 10x faster, Wow, that's cool. I wanna do that again. Well, it's also like,
here's the thing I've heard about in a different domain, and I don't have to rewrite on my code. I can learn a new trick, right?
Well, that's called growth, (chuckles) you know? And so, one thing that I think is cool about Mojo,
and again, those will take a little bit of time, for example, the blog posts and the books and, like,
all that kinda stuff to develop and the language needs to get further along. But what we're doing, you talk about types,
like you can say, look, you can start with the world you already know and you can progressively learn new things
and adopt them where it makes sense. And if you never do that, that's cool. You're not a bad person. (chuckles)
If you get really excited about it and wanna go all the way in the deep end and rewrite everything and, like, whatever, that's cool, right?
But I think the middle path is actually the more likely one where it's, you know, you come out with a a new idea and you discover,
wow, that makes my code way simpler, way more beautiful way, faster way, whatever. And I think that's what people like.
Now if you fast forward and you said, like, 10 years out, right,
I can give you a very different answer on that, which is, I mean, if you go back and look at what computers looked like 20 years ago,
every 18 months, they got faster for free, right, 2x faster every 18 months.
It was like clockwork. It was free, right? You go back 10 years ago and we entered in this world
where suddenly we had multi-core CPUs and we had, and if you squint and turn your head,
what a GPUs is just a many-core, very simple CPU thing kind of, right?
And 10 years ago it was CPUs and GPUs and graphics.
Today, we have CPU, GPUs, graphics. And AI, because it's so important,
because the compute is so demanding because of the smart cameras and the watches and all the different places
that AI needs to work in our lives, it's caused this explosion of hardware. And so part of my thesis,
part of my belief of where computing goes, if you look out 10 years from now, is it's not gonna get simpler.
Physics isn't going back to where we came from. It's only gonna get weirder from here on out, right? And so to me,
the exciting part about what we're building is it's about building that universal platform,
which the world can continue to get weird. 'Cause again, I don't think it's avoidable, it's physics,
but we can help lift people, scale, do things with it, and they don't have to rewrite their code every time a new device comes out.
And I think that's pretty cool. And so if Mojo can help with that problem, then I think that it will be hopefully quite interesting
and quite useful to a wide range of people because there's so much potential. And like there's so much, you know,
maybe analog computers will become a thing or something, right? And we need to be able to get into a mode where we can move this programming model forward,
but do so in a way where we're lifting people and growing them instead of forcing them to rewrite all their code and exploding them.
- Do you think there'll be a few major libraries that go Mojo first?
- Well, so I mean, the Modular engines on Mojo. (chuckles) So again, come back to, like, we're not building Mojo because it's fun.
We're building Mojo because we had to solve these accelerators. - That's the origin story, but I mean, ones that are currently in Python.
- Yeah, so I think that a number of these projects will. And so one of the things, and again, this is just my best guess. Like, each of the package maintainers also has...
I'm sure plenty of other things going on. People really don't like rewriting code just for the sake of rewriting code.
But sometimes like people are excited about like adopting a new idea. - Yeah.
- And turns out that while rewriting code is generally not people's first thing,
turns out that redesigning something while you rewrite it and using a rewrite as an excuse to redesign
can lead to the 2.0 of your thing that's way better than the 1.0, right?
And so I have no idea, I can't predict that, but there's a lot of these places where, again,
if you have a package that is half C and half Python, right, you just solve the pain,
make it easier to move things faster, make it easier to bug and evolve your tech adopting Mojo
kinda makes sense to start with. And then it gives you this opportunity to rethink these things. - So the two big gains are that there's a performance gain
and then there's the portability to all kinds of different devices.
- And there's safety, right? So you talk about real types. I mean, not saying this is for everybody,
but that's actually a pretty big thing, right? - [Lex] Yeah, types are. - And so there's a bunch of different aspects of what, you know, what value Mojo provides.
And so, I mean, it's funny for me, like, I've been working on these kinds of technologies and tools for too many years now,
but you look at Swift, right, and we talked about Swift for TensorFlow, but Swift as a programming language, right?
Swift's now 13 years old from when I started it? - [Lex] Yeah.
- 'Cause I started in 2010, if I remember. And so that project, and I was involved with it for 12 years or something, right,
that project has gone through its own really interesting story arc, right? And it's a mature, successful,
used by millions of people system, right? Certainly not dead yet, right? But also going through that story arc,
I learned a tremendous amount about building languages, about building compilers, about working with the community and things like this.
And so that experience, like I'm helping channel and bring directly into Mojo and, you know, other systems, same thing.
Like, apparently I like building, and iterating and evolving things. And so you look at this LLVM thing that I worked on 20 years ago, and you look at MLIR, right?
And so a lot of the lessons learned in LLVM got fed into MLIR, and I think that MLIR is a way better system than LLVM was.
And, you know, Swift is a really good system and it's amazing, but I hope that Mojo will take
the next step forward in terms of design.
Mojo playground
- In terms of running Mojo and people can play with it, what's Mojo Playground? - Yeah.
- And from the interface perspective and from the hardware perspective,
what's this incredible thing running on? - Yeah, so right now, so here we are, two weeks after launch.
- Yes. - We decided that, okay, we have this incredible set of technology that we think might be good,
but we have not given it to lots of people yet. And so we were very conservative and said, "Let's put it in a workbook so that if it crashes,
we can do something about it. We can monitor and track that, right?" And so, again, things are still super early,
but we're having like one person a minute sign up with over 70,000 people (chuckles)
two weeks in is kinda crazy. - And you can sign up to Mojo Playground and you can use it in the cloud.
- [Chris] Yeah. - In your browser. - [Chris] And so what that's running on, right? - Notebook. - Yeah, What that's running on is that's running on cloud VMs.
And so you share a machine with a bunch of other people, but turns out there's a bunch of them now
because there's a lot of people. And so what you're doing is you're getting free compute and you're getting to play with this thing in kind of a limited controlled way
so that we can make sure that it doesn't totally crash and be embarrassing, right? - Yeah.
- So now a lot of the feedback we've gotten is people wanna download it around locally. So we're working on that right now. And so- - So that's the goal,
to be able to download locally to it. - Yeah, that's what everybody expects. And so we're working on that right now. And so we just wanna make sure that we do it right.
I think this is one of the lessons I learned from Swift also, by the way, is when we launched Swift,
gosh, it feels like forever ago, it was 2014, and we, I mean, it was super exciting.
I, and we, the team had worked on Swift for a number of years in secrecy, okay? And (chuckles) four years into this development,
roughly, of working on this thing, at that point, about 250 people at Apple knew about it.
- [Lex] Yeah. - Okay? So it was secret. Apple's good at secrecy and it was a secret project. And so we launched this at WWC,
a bunch of hoopla and excitement and said developers are gonna be able to develop and submit apps in the App Store in three months, okay?
Well, several interesting things happened, right? So first of all, we learned that it had a lot of bugs.
It was not actually production quality, and it was extremely stressful in terms of like trying
to get it working for a bunch of people. And so what happened was we went from zero to, you know,
I don't know how many developers Apple had at the time, but a lot of developers overnight. And they ran to a lot of bugs and it was really embarrassing
and it was very stressful for everybody involved, right? It was also very exciting 'cause everybody was excited about that.
The other thing I learned is that when that happened, roughly every software engineer who did not know about the project at Apple,
their head exploded when it was launched 'cause they didn't know it was coming. And so they're like, "Wait, what is this?
I signed up to work for Apple because I love Objective-C. Why is there a new thing?," right? - Yeah. - And so now what that meant practically is
that the push from launch to first of all the fall, but then to 2.0 and 3.0 and like all the way forward was
super painful for the engineering team and myself. It was very stressful. The developer community was very grumpy about it
because they're like, "Okay, well, wait a second. You're changing and breaking my code, and like, we have to fix the bugs." And it was just like a lot of tension
and friction on all sides. There's a lot of technical debt in the compiler
because we have to run really fast and you have to go implement the thing and unblock the use case and do the thing. And you know it's not right,
but you never have time to go back and do it right. And I'm very proud of the Swift team because they've come, I mean, we,
but they came so far and made so much progress over this time since launch, it's pretty incredible.
And Swift is a very, very good thing, but I just don't wanna do that again, right? And so- - So iterate more
through the development process. - And so what we're doing is we're not launching it when it's hopefully 0.9 with no testers.
We're launching it and saying it's 0.1, right? And so we're setting expectations of saying like, okay, well, don't use this for production, right?
If you're interested in what we're doing, we'll do it in an open way and we can do it together,
but don't use it in production yet. Like, we'll get there, but let's do it the right way. And I'm also saying we're not in a race.
The thing that I wanna do is build the world's best thing. - [Lex] Yeah. - Right, because if you do it right
and it lifts the industry, it doesn't matter if it takes an extra two months. - Yeah. - Like two months is worth waiting. And so doing it right
and not being overwhelmed with technical debt and things like this is like, again, war wounds, lessons learned,
whatever you wanna say, I think is absolutely the right thing to do. Even though right now people are very frustrated that, you know,
you can't download it or that it doesn't have feature X or something like this. And so- - What have you learned
Jeremy Howard
in a little bit of time since it's been released into the wild that people have been complaining about feature X or Y or Z?
What have they been complaining about? Whether they have been excited about like,
almost like detailed things versus a big thing. I think everyone's would be very excited about the big vision.
- Yeah, yeah. Well, so I mean, I've been very pleased. I mean, in fact, I mean, we've been massively overwhelmed with response, which is a good problem to have.
It's kinda like a success disaster, in a sense, right? - Yeah. - And so, I mean,
if you go back in time when we started Modular, which is just not yet a year and a half ago, so it's still a pretty new company, new team,
small but very good team of people, like we started with extreme conviction
that there's a set of problems that we need to solve. And if we solve it, then people will be interested in what we're doing, right?
But again, you're building in basically secret, right? You're trying to figure it out.
The creation's a messy process. You're having to go through different paths and understand what you wanna do and how to explain it.
Often when you're doing disruptive and new kinds of things, just knowing how to explain it is super difficult, right?
And so when we launched, we hope people would be excited, but, you know, I'm an optimist, but I'm also like,
don't wanna get ahead of myself. And so when people found out about Mojo, I think their heads exploded a little bit, right?
And, you know, here's a, I think a pretty credible team that has built some languages and some tools before. And so they have some lessons learned
and are tackling some of the deep problems in the Python ecosystem and giving it the love and attention that it should be getting.
And I think people got very excited about that. And so if you look at that, I mean, I think people are excited about ownership
and taking a step beyond Rust, right? And there's people that are very excited about that and there's people that are excited about, you know,
just like I made Game of Life go 400 times faster, right, and things like that, and that's really cool.
There are people that are really excited about the, okay, I really hate writing stuff in C++, save me.
- Like systems in your, they're like stepping up, like, oh yes. - And so that's me by the way, also.
- [Lex] Yeah. - I really wanna stop writing C++, but the- - I get third person excitement when people tweet,
Here, I made this code, Game of Life or whatever, faster. And you're like, yeah. - Yeah, and also like,
well, I would also say that, let me cast blame out to people who deserve it.
- [Lex] Sure. - These terrible people who convinced me to do some of this. Jeremy Howard, that guy. - Yes, yes.
Well, he's been pushing for this kinda thing. He's been pushing- - He's wanted this for years. - Yeah, he's wanted this for a long, long time. - [Chris] He's wanted this for years. And so-
- For people who don't know Jeremy Howard, he is like one of the most legit people in the machine learning community.
He's a grassroots, he really teaches, he's an incredible educator, he is an incredible teacher, but also legit in terms of a machine learning engineer
himself. - Yes. - And he's been running the fast.AI and looking, I think for exactly what you've done
with Mojo. - Exactly. And so, I mean, the first time, so I met Jeremy pretty early on,
but the first time I sat up and I'm like, this guy is ridiculous,
is when I was at Google and we were bringing up TPUs and we had a whole team of people and there was this competition called Don Bench
of who can train ImageNet fastest, right? - Yeah. Yes.
- And Jeremy and one of his researchers crushed Google (chuckles) by not through sheer force
of the amazing amount of compute and the number of TPUs and stuff like that, that he just decided that progressive imagery sizing
was the right way to train the model in. You were epoch faster and make the whole thing go vroom,
right? - Yep. - And I'm like, "This guy is incredible." So you can say, - Right.
anyways, come back to, you know, where's Mojo coming from? Chris finally listened to Jeremy.
(Lex laughing) It's all his fault. - Well, there's a kinda very refreshing,
pragmatic view that he has about machine learning that I don't know if it,
it's like this mix of a desire for efficiency, but ultimately grounded and desired to make machine learning
more accessible to a lot of people. I don't know what that is. - Yeah. - I guess that's coupled with efficiency and performance,
but it's not just obsessed about performance. - Well, so a lot of AI and AI research ends up being
that it has to go fast enough to get scale. So a lot of people don't actually care about performance,
particularly on the research side until it allows 'em to have more a bigger dataset, right? And so suddenly now you care about distributed compute
and like, all these exotic HPC, like, you don't actually wanna know about that. You just want to be able to do more experiments faster
and do so with bigger datasets, right? And so Jeremy has been really pushing the limits. And one of the things I'll say about Jeremy,
and there's many things I could say about Jeremy, 'cause I'm a fanboy of his, but it fits in his head,
and Jeremy actually takes the time where many people don't to really dive deep into why is the beta parameter
of the atom optimizer equal to this, right? - Yeah. - And he'll go survey and understand
what are all the activation functions in the trade-offs, and why is it that everybody that does, you know, this model, pick that thing.
- So the why, not just trying different values, like, really what is going on here? - Right, and so as a consequence of that, like he's always,
he, again, he makes time, but he spends time to understand things at a depth that a lot of people don't.
And as you say, he then brings it and teaches people- - [Lex] Teaches it. - And his mission is to help lift, you know,
his website says "making AI uncool again," like it's about, like, forget about the hype. It's actually practical and useful.
Let's teach people how to do this, right? Now the problem Jeremy struggled with is that he's pushing the envelope, right?
Research isn't about doing the thing that is staying on the happy path or the well-paved road, right?
And so a lot of the systems today have been these really fragile, fragmented things, are special case in this happy path.
And if you fall off the happy path, you get eaten by an alligator. (chuckles) - (chuckles) So what about...
So Python has this giant ecosystem of packages
and there's a package repository. Do you have ideas of how to do that well for Mojo,
how to do a repository of packages well? - So that's another really interesting problem that I knew about but I didn't understand
how big of a problem it was: Python packaging. A lot of people have very big pain points
and a lot of scars with Python packaging. - Oh, you mean, so there's several things to say. - [Chris] Building and distributing
and managing dependencies - Yes. - [Chris] and versioning and all this stuff. - So from the perspective of,
if you want to create your own package, and then - Yes, yeah. - or you wanna build on top of a bunch of other people's packages
and then they get updated and things like this. Now, I'm not an expert in this, so I don't know the answer.
I think this is one the reasons why it's great that we work as a team and there's other really good and smart people involved,
but one of the things I've heard from smart people who've done a lot of this is that the packaging becomes
a huge disaster when you get the Python and C together.
And so if you have this problem where you have code split between Python and C, now not only do you have to package the C code,
you have to build the C code. C doesn't have a package manager, right? C doesn't have a dependency versioning
management system, right? And so I'm not experiencing the state-of-the-art and all the different Python package managers,
but my understanding is that's a massive part of the problem. And I think Mojo solves that part of the problem directly heads on.
Now, one of the things I think we'll do with the community, and this isn't, again, we're not solving all the world's problems at once,
we have to be kinda focused, start with, is that I think that we will have an opportunity to reevaluate packaging, right?
And so I think that we can come back and say, okay, well, given the new tools and technologies and the cool things we have that we've built up,
because we have not just syntax we have an entirely new compiler stack that works in a new way, maybe there's other innovations we can bring together
and maybe we can help solve that problem. - So almost a tangent to that question from the user perspective of packages.
It was always surprising to me that it was not easier to sort of explore and find packages,
you know, with, with PIP install. It's an incredible ecosystem. It's huge.
It's just interesting that it wasn't made. It's still, I think, not made easier to discover packages to do, yeah.
like search and discovery as YouTube calls it.
- Well, I mean, it is kinda funny because this is one of the challenges of these like intentionally decentralized communities.
And so- - Yeah. - I don't know what the right answer is for Python. I mean, there are many people
that I don't even know the right answer for Mojo. Like, so there are many people that would have
much more informed opinions than I do, but it's interesting, if you look at this, right? Open source communities, you know, there's Git.
Git is a fully de decentralized and anybody can do it any way they want, but then there's GitHub, right?
And GitHub centralized commercial in that case, right? Thing really helped pull together and help solve some of the discovery problems and help build a more consistent community. And so maybe there's opportunities for-
- There's something like a GitHub for- - Yeah.
- Although even GitHub, I might be wrong on this, but the search and discovery for GitHub is not that great.
Like, I still use Google search. - Yeah, well, I mean, maybe that's because GitHub doesn't
wanna replace Google search, right? I think there is room for specialized solutions to specific problems, but sure, I don't know.
I don't know the right answer for GitHub either. They can go figure that out.
- But the point is to have an interface that's usable, that's successful to people of all different skill levels and- - So, well, and again,
like what are the benefit of standards, right? Standards allow you to build these next level-up ecosystem and next level-up infrastructure and next level-up things.
And so, again, come back to, I hate complexity, C+ Python is complicated.
It makes everything more difficult to deal with. It makes it difficult to port, move code around, work with all these things get more complicated.
And so, I mean, I'm not an expert, but maybe Mojo can help a little bit by helping reduce the amount of C in this ecosystem
and make it therefore scale better. - So any kinda packages that are hybrid in nature would be a natural fit to move to Mojo, which-
- Which is a lot of them, by the way. - Yeah. - So a lot of them, especially that are doing some interesting stuff
computation wise. - Yeah, yeah. Let me ask you about some features. - Yeah. - So we talked about obviously indentation,
Function overloading
that it's a typed language or optionally typed. Is that the right way to say it?
- It's either optional or progressively or- - Progressively, okay. - I think the... So people have very strong opinions
on the right word to use. - Yeah. - [Chris] I don't know. - I look forward to your letters. So there's the var versus let, but let is for constance.
- Yeah. - Var is an optional. - Yeah, var makes it mutable. So you can reassign.
- Okay. Then there's function overloading.
- Oh okay, yeah. - I mean, there's a lot of source of happiness for me, but function overloading, that's, I guess,
is that for performance or is that... Why does Python not have function overloading?
- So I can speculate. So Python is a dynamic language. The way it works is that Python and Objective-C are
actually very similar worlds if you ignore syntax.
And so Objective-C is straight line derived from Smalltalk,
a really venerable interesting language that much of the world has forgotten about, but the people that remember it love it generally.
And the way that Smalltalk works is that every object has a dictionary in it. And the dictionary maps from the name of a function
or the name of a value within an object to its implementation. And so the way you call a method and Objective-C is you say,
go look up, the way I call foo is I go look up foo, I get a pointer to the function back, and then I call it, okay, that's how Python works, right?
And so now the problem with that is that the dictionary within a Python object, all the keys are strings and it's a dictionary. Yeah.
So you can only have one entry per name. You think. - It's as simple as that. - I think it's as simple as that. And so now why do they never fix this?
Like, why do they not change it to not be a dictionary anymore, they not change, like do other things?
- Well, you don't really have to in Python because it's dynamic. And so you can say, I get into the function now,
if I got past an integer, do some dynamic test for it, if it's a string, go do another thing.
There's another additional challenge, which is even if you did support overloading, you're saying, okay, well, here's a version of a function for integers
and a function for strings. Well, even if you could put it in that dictionary, you'd have to have the collar do the dispatch.
And so every time you call the function, you'd have to say like, is it an integer or is it a string? And so you'd have to figure out where to do that test.
And so in a dynamic language, overloading is something you, general, you don't have to have.
But now you get into a type language and, you know, in Python, if you subscript with an integer,
then you get typically one element out of a collection. If you subscript with a range,
you get a different thing out, right? And so often in type languages, you'll wanna be able to express the fact that, cool,
I have different behavior, depending on what I actually pass into this thing. And if you can model that,
it can make it safer and more predictable and faster, and, like, all these things. - It somehow feels safer, yes,
but also feels empowering, like in terms of clarity. Like you don't have to design whole different functions.
- Yeah, well, and this is also one of the challenges with the existing Python typing systems is that in practice,
like you take subscript, like in practice, a lot of these functions,
they don't have one signature, right? They actually have different behavior in different cases. And so this is why it's difficult
to like retrofit this into existing Python code and make it play well, with typing.
You kinda have to design for that. - Okay, so there's a interesting distinction that people that program Python might be interested in is def versus fn.
So it's two different ways to define a function. - Yep. - And fn is a stricter version of def.
What's the coolness that comes from the strictness? - So here you get into, what is the trade-off with the superset?
- Yes. - Okay, so superset, you have to, or you really want to be compatible.
Like, if you're doing a superset, you've decided compatibility with existing code is the important thing,
even if some of the decisions they made were maybe not what you'd choose. - Yeah, okay. - So that means you put a lot of time into compatibility
and it means that you get locked into decisions of the past, even if they may not have been a good thing, right?
Now, systems programmers typically like to control things, right, and they wanna make sure that, you know,
not all cases of course, and even systems programmers are not one thing, right, but often you want predictability.
And so one of the things that Python has, for example, as you know, is that if you define a variable, you just say, X equals four, I have a variable name to X.
Now I say some long method, some long name equals 17, print out some long name, oops, but I typoed it, right?
Well, the compiler, the Python compiler doesn't know in all cases what you're defining and what you're using,
and did you typo the use of it or the definition, right? And so for people coming from type languages, again,
I'm not saying they're right or wrong, but that drives 'em crazy because they want the compiler to tell them, you type out the name of this thing, right?
And so what fn does is it turns on, as you say, it's a strict mode and so it says, okay, well, you have to actually declare,
intentionally declare your variables before you use them. That gives you more predictability, more error checking and things like this,
but you don't have to use it. And this is a way that Mojo is both compatible
'cause defs work the same way that defs have already always worked, but it provides a new alternative
that gives you more control. And it allows certain kinds of people that have a different philosophy to be able to express that and get that.
- But usually if you're writing Mojo code from scratch, you'll be using fn.
- It depends, again, it depends on your mentality, right? It's not that def is Python and fn is Mojo. Mojo has both, and it loves both, right?
It really depends on that is just strict. Yeah, exactly. Are you playing around and scripting something out?
Is it a one-off throwaway script? Cool. Like, Python is great at that. - I'll still be using fn, but yeah.
- Well, so I love strictness. Okay. - Well, so control, power. You also like suffering, right?
Yes, go hand in hand. - How many pull-ups? - I've lost count at this. Yeah, exactly.
At this point. - So, and that's cool. I love you for that. Yeah. And I love other people who like strict things, right,
but I don't want to say that that's the right thing because python's also very beautiful for hacking around and doing stuff in research
and these other cases where you may not want that. - You see, I just feel like maybe I'm wrong in that,
but it feels like strictness leads to faster debugging. So in terms of going from,
even on a small project from zero to completion, it just, I guess it depends how many bugs you generate usually. Yeah.
- Well, so I mean, if it's again, lessons learned in looking at the ecosystem, it's really, I mean, I think it's,
if you study some of these languages over time, like the Ruby community for example, now Ruby is a pretty well, developed,
pretty established community, but along their path they really invested in unit testing. Like, so I think that the Ruby community is
really pushed forward the state-of-the-art of testing because they didn't have a type system that caught a lot of bugs at compile time, right?
And so you can have the best of both worlds. You can have good testing and good types, right, and things like this, but I thought that it was really interesting
to see how certain challenges get solved. And in Python, for example, the interactive notebook kind of experiences
and stuff like this are really amazing. And if you typo something, it doesn't matter. It just tells you it's fine, right?
And so I think that the trades are very different if you're building a, you know, large scale production system
versus you're building an exploring a notebook. - And speaking of control, the hilarious thing, if you look at code,
I write just for myself, for fun, it's like littered with asserts everywhere, okay?
- It's a kinda, well, then. - Yeah, you would like text. - It's basically saying in a dictatorial way,
this should be true now, otherwise everything stops. - Well, and that is the sign.
And I love you, man, but that is a sign of somebody who likes control. And so, yes. - Yeah.
- I think that you'll like f i this turning into a, I think I like Mojo. - Therapy session. Yes. I definitely will.
Error vs Exception
Speaking of asserts exceptions are called errors. Why is it called errors?
- So we, I mean, we use the same, we're the same as Python, right, but we implement it a very different way, right?
And so if you look at other languages, like we'll pick on C++ our favorite, right?
C++ has a thing called zero-cost exception handling, okay? So, and this is in my opinion,
something to learn lessons from. - It's a nice polite way of saying it. - And so, zero-cost exception handling,
the way it works is that it's called zero-cost because if you don't throw an exception,
there's supposed to be no overhead for the non-error code. And so it takes the error path out of the common path.
It does this by making throwing an error extremely expensive. And so if you actually throw an error
with a C++ compiler using exceptions has to go look up in tables on the side and do all this stuff.
And so throwing an error can be like 10,000 times more expensive than referring from a function, right?
Also, it's called zero-cost exceptions, but it's not zero-cost by any stretch of the imagination
because it massively blows out your code, your binary, it also adds a whole bunch of different paths
because of disrupts and other things like that that exist in C++ plus, and it reduces the number of optimizations it has,
like all these effects. And so this thing that was called zero-cost exceptions,
it really ain't, okay. Now if you fast forward to newer languages
and this includes Swift and Rust and Go and now Mojo,
well, and Python's a little bit different because it's interpreted and so like, it's got a little bit of a different thing going on. But if you look at it, if you look at compiled languages,
many newer languages say, okay, well, let's not do that zero-cost exception handling thing.
Let's actually treat and throwing an error the same as returning a variant returning either the normal result or an error.
Now programmers generally don't want to deal with all the typing machinery and like pushing around a variant.
And so you use all the syntax that Python gives us, for example, try and catch and it, you know,
functions that raise and things like this. You can put a raises decorator on your functions, stuff like this. And if you wanna control that,
and then the language can provide syntax for it. But under the hood, the way the computer executes it,
throwing an error is basically as fast as returning something. - Oh, interesting. So it's exactly the same way from a compile perspective.
- And so this is actually, I mean, it's a fairly nerdy thing, right, which is why I love it,
but this has a huge impact on the way you design your APIs, right?
So in C++ huge communities turn off exceptions
because the cost is just so high, right? And so the zero-cost cost is so high, right?
And so that means you can't actually use exceptions in many libraries, right?
Interesting. Yeah. And even for the people that do use it, well, okay, how and when do you wanna pay the cost?
If I try to open a file, should I throw an error? Well, what if I'm probing around,
looking for something, right, and I'm looking it up in many different paths? Well, if it's really slow to do that,
maybe I'll add another function that doesn't throw an error or turns in error code instead. And now I have two different versions of the same thing.
And so it causes you to fork your APIs. And so, you know, one of the things I learned from Apple and I so love is
the art of API design is actually really profound. I think this is something that Python's also done a pretty good job at in terms of building out
this large scale package ecosystem. It's about having standards and things like this. And so, you know, we wouldn't wanna enter a mode where, you know,
there's this theoretical feature that exists in language, but people don't use it in practice. Now I'll also say one of the other really cool things
about this implementation approach is that it can run on GPUs and it can run on accelerators and things like this.
And that standard zero-cost exception thing would never work on an accelerator. And so this is also part of how Mojo
can scale all the way down to like little embedded systems and to running on GPUs and things like that.
- Can you actually say about the... Maybe is there some high-level way to describe the challenge
of exceptions and how they work in code during compilation?
So it's just this idea of percolating up a thing and error.
- Yeah, yeah. So the way to think about it is, think about a function that doesn't return anything,
just as a simple case, right? And so you have function one calls function two,
calls function three, calls function four, along that call stack that are tribe blocks, right?
And so if you have function one calls function two, function two has a tribe block, and then within it it calls function three, right?
Well, what happens if function three throws? Well, actually start simpler. What happens if it returns?
Well, if it returns, it's supposed to go back out and continue executing and then fall off the bottom of the tribe block
and keep going and it all's good. If the function throws, you're supposed to exit the current function and then get into the accept clause, right,
and then do whatever codes there and then keep falling on and going on. And so the way that a compiler like Mojo works is
that the call to that function, which happens in the accept block calls the function, which happens in the accept block calls the function,
and then instead of returning nothing, it actually returns, you know, an a variant between nothing and an error.
And so if you return, normally fall off the bottom, or do return, you return nothing. And if you throw, throw an error,
you return the variant. That is, I'm an error, right? So when you get to the call, you say,
okay, cool, I called a function. Hey, I know locally I'm in a tribe block, right? And so I call the function
and then I check to see what it returns. Aha. Is that error thing jump to the accept block.
- And that's all done for you behind the scenes. - Exactly. And so the competitor does all this for you.
And I mean, one of the things, if you dig into how this stuff works in Python, it gets a little bit more complicated because you have finally blocks,
which you need to go into do some stuff, and then those can also throw and return.
- Wait, What? Nested? - Yeah, and like the stuff matters for compatibility. Like, there's really-
- Can nest them. - there's with clauses, and so with clauses, are kinda like finely blocks with some special stuff going on.
And so there's nesting. - In general, nesting of anything, nesting of functions should be illegal.
Well, it just feels like it adds a level of complexity. - Lex, I'm merely an implementer. And so this is again, one last question.
One of the trade-offs you get when you decide to build a superset is you get to implement a full fidelity
implementation of the thing that you decided is good. And so, yeah, I mean,
we can complain about the reality of the world and shake our fist, but- - It always feels like you shouldn't be allowed to do that.
Like, to declare functions in certain functions inside functions, that seems- - Oh, wait, wait, wait.
What happened to Lex, the Lisp guy? - No, I understand that, but Lisp is what I used to do in college.
- So now you've grown up. - You know, we've all done things in college we're not proud of.
No, wait a sec, wait a sec. I love Lis, I love Lis. - Okay. Yeah, I was gonna say, you're afraid of me irritating the whole internet.
- Like yeah, no, I love Lisp. It worked as a joke in my head and come out, right?
- So nested functions are, joking aside, actually really great and for certain things, right? And so these are also called closures.
Closures are pretty cool and you can pass callbacks. There's a lot of good patterns. And so- - So speaking of which,
Mojo roadmap
I don't think you have nested function implemented yet in Mojo.
- We don't have Lambda syntax, but we do have Nest. - Lambda syntax nested. - Functions. Yeah. - There's a few things on the roadmap that you have
that it'd be cool to sort of just fly through, 'cause it's interesting to see, you know, how many features there are in a language small and big.
Yep. They have to implement. Yeah. So first of all there's Tuple support, and that has to do with some of their specific aspect of it,
like the parentheses or not parenthesis that Yeah. - This is just a totally a syntactic thing. - A syntactic thing, okay.
There's, but it is cool. It's still so keyword arguments and functions.
- Yeah, so this is where in Python, you can say call function X equals four and X is the name- - Yeah.
- of the argument. That's a nice sort of documenting salt documenting feature. Yep.
- Yeah, I mean, and again, this isn't rocket science to implement this, just the laundry list. - It's just on the list.
The bigger features are things like traits. So traits are when you wanna define abstract.
So when you get into typed languages, you need the ability to write generics.
And so you wanna say, I wanna write this function and now I want to work on all things that are arithmetic.
Like, well, what does arithmetic like, mean? Well, arithmetic like is a categorization of a bunch of types.
Again, you can define many different ways, and I'm not gonna go into ring theory or something, but the,
you know, you can say it's arithmetic. Like if you can add, subtract, multiply, divide it for example, right? And so what you're saying is you're saying there's a set
of traits that apply to a broad variety of types. And so they're all these types arithmetic,
like, all these tensors and floating point integer and, like, there's this category of of types.
And then I can define on an orthogonal access algorithms that then work against types that have those properties.
It's been implemented in Swift and Rust in many languages.
So it's not Haskell, which is where everybody learns their tricks from,
but we need to implement that, and that'll enable a new level of expressivity. - So classes.
- Yeah, classes are a big deal. - It's a big deal still to be implemented.
Like you said, Lambda syntax, and there's,, like, detailed stuff, like whole module import support
for top-level code and file scope.
And then global variables also. So being able to have variables outside of a top
level. - Well, and so this comes back to the where Mojo came from, and the fact that this is your 0.1, right?
So Modular's building an AI stack, right? And an AI stack has a bunch of problems working
with hardware and writing high-performance kernels and doing this kernel fusion thing I was talking about,
and getting the most out of the hardware. And so we've really prioritized and built Mojo to solve Modular's problem.
Right now our North Star is built out to support all the things. And so we're making incredible progress.
By the way, Mojo's only, like, seven months old. So that's another interesting thing.
- Well, I mean part of the reason I wanted to mention some of these things is like, there's a lot to do and it's pretty cool how you just kinda,
sometimes you take for granted how much there is in a programming language, how many cool features you kinda rely on.
And this is kinda a nice reminder when you lay it as its do list. - Yeah and so, I mean, but also you look into,
it's amazing how much is also there and you take it for granted that a value, if you define it,
it will get destroyed automatically. Like, that little feature itself is actually really complicated given the way the ownership system has to work.
And the way that works within Mojo is a huge step forward from what Rust and Swift have done.
- Wait, can you say that again? When value- - Yeah. When you define it gets destroyed automatically. - Yeah. So like, like say you have a string, right?
So you define a string on the stack. Okay. Or on whatever that means, like in your local function, right?
And so you say like whether it be in a def and so you just say X equals hello world, right?
Well, if your strength type requires you to allocate memory, then when it's destroyed, you have to deallocate it.
So in Python and in Mojo, you define that with a Dell method, right? Where does that get run?
Well, it gets run sometime between the last use of the value and the end of the program.
Like in this, you now get into garbage collection, you get into, like, all these long debated, you talk about religions
and trade-offs and things like this. This is a hugely hotly contested world.
If you look at C++, the way this works is that if you define a variable or a set of variables within a function,
they get destroyed in a last in, first out order. So it's like nesting, okay.
This has a huge problem because if you have a big scope and you define a whole bunch of values at the top
and then you use 'em and then you do a whole bunch of code that doesn't use them, they don't get destroyed until the very end of that scope, right?
And so this also destroys tail calls. So good functional programming, right? This has a bunch of different impacts on, you know,
you talk about reference counting optimizations and things like this. A bunch of very low-level things. And so what Mojo does is it has a different approach
on that from any language I'm familiar with, where it destroys them as soon as possible.
And by doing that you get better memory use, you get better predictability, you get tail calls that work, you get a bunch of other things,
you get better ownership tracking. There's a bunch of these very simple things that are very fundamental that are
already built in there in Mojo today that are the things that nobody talks about generally, but when they don't work right,
you find out and you have to complain about. - Is it trivial to know what's the soonest possible
to delete a thing that it's not gonna be used again? - Yeah. Well, I mean, it's generally trivial.
It's after the last use of it. So if you just find X as a string and then you have some use of X somewhere in your code-
- Within that scope, you mean, within the scope that is accessible? - It's, yeah, exactly. So you can only use something within its scope. Yeah.
And so then it doesn't wait until the end of the scope to delete it, it destroys it after the last use.
- So there's kinda some very eager machine that's just sitting there and deleting. Yeah. - And it's all in the compiler.
So it's not at runtime, which is also cool. And so interesting. Yeah.
And this is actually non-trivial because you have control flow, right? And so it gets complicated pretty quickly. And so like angst, right? Was not, not.
- Well, so you have to insert delete, like in a lot of places. - Potentially. Yeah, exactly. So the compiler has to reason about this.
And this is where again, it's experience building languages and not getting this right. So again, you get another chance to do it
and you get basic things like this, right? But it's extremely powerful when you do that, right? And so there's a bunch of things like that, that kinda combine together.
And this comes back to the, you get a chance to do it the right way, do it the right way, and make sure that every brick you put down is really good.
So that when you put more bricks on top of it, they stack up to something that's beautiful. - Well, there's also, like, how many design discussions do there have to be
about particular details like implementation of particular small features?
Because the features that seem small, I bet some of them might be like really require
really big design decisions. - Yeah. Well, so I mean, lemme give you another example of this.
Python has a feature called async/await. So it's a new feature. I mean, in the long arc of Python history,
it's a relatively new feature, right, that allows way more expressive, asynchronous programming.
Okay? Again, this is a Python's a beautiful thing. And they did things that are great for Mojo for completely different reasons.
The reason that async/await got added to Python, as far as I know, is because Python doesn't support threads, okay?
And so Python doesn't support threads, but you wanna work with networking and other things, like, that can block.
I mean, Python does support threads, it's just not its strength.
And so they added this feature called async/await. It's also seen in other languages like Swift and JavaScript and many other places as well.
Async/await and Mojo is amazing 'cause we have a high-performance, heterogeneous compute runtime underneath the covers
that then allows non-blocking I/O so you get full use of your accelerator.
That's huge. Turns out it's actually really an important part of fully utilizing the machine. You talk about design discussions,
that took a lot of discussions, right? And it probably will require more iteration. And so my philosophy with Mojo is that, you know,
we have a small team of really good people that are pushing forward and they're very good at the extremely deep knowing
how the compiler and runtime and, like, all the low-level stuff works together, but they're not perfect.
It's the same thing as the Swift team, right? And this is where one of the reasons we released Mojo much earlier is so we can get feedback
and we've already like renamed a keyword data community feedback, which one?
We use an ampersand now it's named in out. We're not renaming existing Python keyword 'cause that breaks compatibility, right?
We're renaming things. We're adding and making sure that they are designed well. We get usage experience,
we iterate and work with the community. Because again, if you scale something really fast and everybody writes all their code and they start using it in production,
then it's impossible to change. And so you wanna learn from people. You wanna iterate and work on that early on.
And this is where design discussions, it's actually quite important to do. - Could you incorporate an emoji,
like into the language, into the main language? Like a good... Like do you have a favorite one?
- Well, I really, like in terms of humor, like rofl, whatever, rolling on the floor laughing.
So that could be like a, what would that be the use case for that? Like an except throw an exception of some sort.
I don't- - You should totally file a feature request. - Or maybe a heart one. It has to be a heart one.
- People have told me that I'm insane. I'm liking this.
- I'm gonna use the viral nature of the internet to get this passed. - I mean, it's funny you come back
to the flame emoji file extension, right? You know, we have the option to use the flame emoji,
which just even that concept, 'cause for example, the people at GitHub say, now I've seen everything.
You know, like. - Yeah, and there's something, it kinda, it's reinvigorating.
It's like, oh, that's possible. That's really cool that for some reason
that makes everything else, like, seem really excited. - I think the world is ready for this stuff, right? And so, you know, when we have a package manager,
we'll clearly have to innovate by having the compiled package thing be the little box with the bow on it, right?
I mean, it has to be done. - It has to be done. Is there some stuff on the roadmap
that you're particularly stressed about, or excited about that you're thinking about? - A lot, I mean, as of today's snapshot,
which will be obsolete tomorrow, the lifetime stuff is really exciting. And so lifetimes give you safe references
to memory without dangling pointers. And so this has been done in languages like Rust before.
And so we have a new approach, which is really cool. I'm very excited about that. That'll be out to the community very soon.
The traits feature is really a big deal. And so that's blocking a lot of API design.
And so there's that. I think that's really exciting. A lot of it is these kinda table stakes features.
One of the things that is again, also lessons learned with Swift is that programmers
in general like to add syntactic sugar. And so it's like, oh well, this annoying thing,
like in Python, you have to spell Underbar armbar ad. Why can't I just use plus def plus?
Come on. Why can't I just do that, right? And so trivial bit of syntactic sugar. It makes sense, it's beautiful, it's obvious.
We're trying not to do that. And so for two different reasons, one of which is that,
again, lesson learned with Swift. Swift has a lot of syntactic sugar, which may may be a good thing, maybe not, I don't know.
But because it's such an easy and addictive thing to do, sugar, like make sure blood get crazy, right?
Like, the community will really dig into that and wanna do a lot of that. And I think it's very distracting from building the core abstractions.
The second is we wanna be a good member of the Python community, right? And so we wanna work with the broader Python community
and yeah, we're pushing forward a bunch of systems programming features and we need to build them out to understand them.
But once we get a long ways forward, I wanna make sure that we go back to the Python community and say, okay, let's do some design reviews.
Let's actually talk about this stuff. Let's figure out how we want this stuff all to work together. And syntactic sugar just makes all that more complicated.
So. - And yeah, list comprehension. Is that yet to be implemented? Yeah.
And my favorite d I mean, I dictionaries. - Yeah, there's some basic 0.1.
- 0.1, yeah. - But nonetheless, it's actually still quite interesting and useful. - As you've mentioned, Modular is very new.
Building a company
Mojo is very new. It's a relatively small team. Yeah. It's building up this.
- Yeah, we're just gigantic stack. Yeah. This incredible stack that's going to perhaps define
the future of development of our AI overlords.
- We just hope it will be useful. - As do all of us. So what have you learned from this process
of building up a team? Maybe one question is how do you hire- - Yeah. - great programmers,
great people that operate in this compiler hardware,
machine learning, software interface design space?
And maybe are- Yeah. - a little bit fluid in what they can do. - So, okay, so language design too.
- So building a company is just as interesting in different ways is building a language, like different skill sets, different things,
but super interesting. And I've built a lot of teams, a lot of different places. If you zoom in from the big problem into recruiting,
well, so here's our problem, okay. I'll be very straightforward about this. We started Modular with a lot of conviction
about we understand the problems, we understand the customer pain points. We need to work backwards from the suffering in the industry.
And if we solve those problems, we think it'll be useful for people. But the problem is that the people
we need to hire, as you say, are all these super specialized people that have jobs at big tech, big tech worlds, right?
And, you know, I don't think we have product market fit in the way that a normal startup does,
or we don't have product market fit challenges because right now everybody's using AI
and so many of them are suffering and they want help. And so again, we started with strong conviction. Now again, you have to hire and recruit the best
and the best all have jobs. And so what we've done is we've said, okay, well, let's build an amazing culture.
Start with that. That's usually not something a company starts with. Usually you hire a bunch of people and then people start fighting
and it turns into gigantic mess. And then you try to figure out how to improve your culture later.
My co-founder, Tim in particular, is super passionate about making sure that that's right. And we've spent a lot of time, early on,
to make sure that we can scale. - Can you comment... Sorry, before we get to the second, what makes for a good culture? - Yeah, so, I mean,
there's many different cultures and I have learned many things from many different people, several very unique, almost famously unique cultures.
And some of them I learned what to do and some of them I learned what not to do. Yep. Okay. And so we want an inclusive culture.
I believe in like amazing people working together. And so I've seen cultures where you have amazing people
and they're fighting each other. I see amazing people and they're told what to do, like doubt. Shout line up and do what I say,
it doesn't matter if it's the right thing, do it right. And neither of these is the... and I've seen people that have no direction.
They're just kinda floating in different places and they wanna be amazing, they just don't know how. And so a lot of it starts with have a clear vision, right?
And so we have a clear vision of what we're doing. And so I kind of grew up at Apple in my engineering life, right?
And so a lot of the Apple DNA rubbed off on me. My co-founder Tim also is like a strong product guy.
And so what we learned is, you know, I saw at Apple that you don't work from building cool technology.
You don't work from, like, come up with cool product and think about the features you'll have in the big check boxes and stuff like this.
'Cause if you go talk to customers, they don't actually care about your product, they don't care about your technology.
What they care about is their problems, right? And if your product can help solve their problems,
well, hey, they might be interested in that, right? And so if you speak to them about their problems, if you understand you have compassion,
you understand what people are working with, then you can work backwards to building an amazing product. - So the vision's done by defining the problem.
- And then you can work backwards in solving technology. Got it. And at Apple, like it's, I think pretty famously said that, you know, for every,
you know, there's a hundred nos for every yes. I would refine that to say
that there's a hundred not yets for every yes. Yeah. But famously, if you go back to the iPhone, for example, right?
iPhone 1, every, I mean, many people laughed at it because it didn't have 3G, it didn't have copy and paste, right?
And then a year later, okay, finally it has 3G, but it still doesn't have copy and paste, it's a joke.
"Nobody will ever use this product," blah, blah, blah, blah, blah, blah, blah, right? Well, year three, had copy and paste, and people stopped talking about it, right?
And so, being laser focused and having conviction and understanding what the core problems
are and giving the team the space to be able to build the right tech is really important.
Also, I mean, you come back to recruiting, you have to pay well, right? So we have to pay industry leading salaries
and have good benefits and things like this. That's a big piece. We're a remote-first company. And so we have to...
So remote-first has a very strong set of pros and cons. On the one hand, you can hire people from wherever they are,
and you can attract amazing talent even if they live in strange places or unusual places.
On the other hand, you have time zones. On the other hand, you have, like, everybody on the internet will fight
if they don't understand each other. And so we've had to learn how to like have a system where we actually fly people in
and we get the whole company together periodically, and then we get work groups together and we plan and execute together. - And there's like an intimacy
to the in-person brainstorming. Yeah, I guess you lose, but maybe you don't. Maybe if you get to know each other well,
and you trust each other, maybe you can do that. Yeah. - Well, so when the pandemic first hit, I mean, I'm curious about your experience too.
The first thing I missed was having whiteboards, right? - Yeah. - Those design discussions where you're like,
I can high, high intensity work through things, get things done, work through the problem of the day,
understand where you're on, figure out and solve the problem and move forward.
But we've figured out ways- - Yeah. - to work around that now with, you know, all these screen sharing
and other things like that that we do. The thing I miss now is sitting down at a lunch table with the team. Yeah.
The spontaneous things like the coffee bar things
and the bumping into each other and getting to know people outside of the transactional solve a problem over Zoom.
- And I think there's just a lot of stuff that I'm not an expert at this. I don't know who is, hopefully there's some people,
but there's stuff that somehow is missing on Zoom. Even with the Y board, if you look at that,
if you have a room with one person at the whiteboard, and then there's like three other people at a table,
there's a, first of all, there's a social aspect to that where you're just shooting the a little bit, almost like.
- Yeah, as people are just kinda coming in and Yeah. - That, but also while the,
like it's a breakout discussion that happens for like seconds at a time, maybe an inside joke or like this interesting dynamic
that happens that's Zoom. - And you're bonding. Yeah. - You're bonding, you're bonding. But through that bonding, you get the excitement.
There's certain ideas are like complete. And you'll see that in the faces of others
that you won't see necessarily on Zoom and like something, it feels like that should be possible to do without being in-person.
- Well, I mean, being in person is a very different thing. Yeah. It's worth it, but you can't always do it.
And so again, we're still learning. Yeah. And we're also learning as like humanity with this new reality, right?
But what we found is that getting people together, whether it be a team or the whole company or whatever is worth the expense
because people work together and are happier after that. Like, it just, like, there's a massive period of time where you're like,
go out and things, start getting frayed, pull people together, and then yeah, you realize that we're all working together,
we see things the same way. We work through the disagreement or the misunderstanding. We're talking across each other and then you work much better together.
And so things like that I think are really quite important. - What about people that are kinda specialized
in very different aspects of the stack working together? What are some interesting challenges there?
- Yeah, well, so I mean, I mean, there's lots of interesting people, as you can tell, I'm, you know, hard to deal with too, but-
- You're one of the most lovable people. - So there's different philosophies
in building teams for me. And so some people say hire 10x programmers,
and that's the only thing, whatever that means, right? What I believe in is building well-balanced teams,
teams that have people that are different in them. Like if you have all generals and no troops
or all troops and no generals, or you have all people that think in one way and not the other way,
what you get is you get a very biased and skewed and weird situation where people end up being unhappy.
And so what I like to do is I like to build teams of people where they're not all the same. You know, we do have teams and they're focused
on like runtime, or compiler GP, or accelerator, or whatever the specialty is, but people bring a different take
and have a different perspective. And I look for people that compliment each other. And particularly if you look at leadership teams and things like this,
you don't want everybody thinking the same way. You want people bringing different perspectives and experiences.
And so I think that's really important. - That's team. But what about building a company as ambitious as Modular?
So what are some interesting questions there? - Oh, I mean, so many. Like, so one of the things I love about...
Okay, so Modular's the first company I built from scratch.
One of the first things that was profound was I'm not cleaning up somebody else's mess, right?
And so if you look at, and. - That's liberating to some degree. - It's super liberating. And also many of the projects I've built in the past
have not been core to the project of the company. Swift is not Apple's product, right?
MLIR is not Google's revenue machine or whatever, right? It's important,
but it's like working on the accounting software for, you know, the retail giant or something, right?
It's like enabling infrastructure and technology. And so at Modular, the tech we're building is here to solve people's problems.
Like, it is directly the thing that we're giving to people. And so this is a really big difference. And what it means for me as a leader,
but also for many of our engineers, is they're working on the thing that matters. And that's actually pretty, I mean, again,
for compiler people and things like that, that's usually not the case, right? And so that's also pretty exciting and quite nice,
but one of the ways that this manifests is it makes it easier to make decisions. And so one of the challenges I've had
in other worlds is it's like, okay, well, community matters somehow for the goodness of the world, or open source matters theoretically,
but I don't wanna pay for a t-shirt. Yeah. right, or some swag, like, well, t-shirts cost 10 bucks each.
You can have 100 t-shirts for $1,000 to a Megacorp, but $1,000 is unaccountably can't count that low.
Yes. Right. But justifying it and getting a t-shirt, by the way, if you'd like a t-shirt, I can give you a t-shirt. - Well, I would 100% like a t-shirt.
Are you joking? - You can have a fire emoji t-shirt. Is that- - I will treasure this. Is that a good thing?
I will pass it down to my grandchildren. - And so, you know, it's very liberating to be able to decide. I think that Lex should have a T-shirt, right?
And it becomes very simple because I like Lex. - This is awesome.
So I have to ask you about one of the interesting developments with large language models
ChatGPT
is that they're able to generate code recently.
Really? Well, yes. To a degree that maybe, I don't know if you understand,
but I struggle to understand because it forces me to ask questions about the nature of programming,
of the nature of thought because the language models are
able to predict the kinda code I was about to write so well. Yep. That it makes me wonder like how unique my brain is
and where the valuable ideas actually come from. Like, how much do I contribute in terms of ingenuity,
innovation to code I write or design and that kinda stuff.
When you stand on the shoulders of giants, are you really doing anything? And what LLMs are helping you do is they help you
stand on the shoulders of giants in your program. There's mistakes. They're interesting that you learn from, but I just,
it would love to get your opinion first high level. Yeah. Of what you think about this impact of large language models
when they do program synthesis, when they generate code. - Yeah. Well, so I don't know where it all goes.
Yeah. I'm an optimist and I'm a human optimist, right? I think that things I've seen are that a lot of the LLMs
are really good at crushing leak code projects and they can reverse the link list like crazy.
Well, it turns out there's a lot of instances of that on the internet, and it's a pretty stock thing. And so if you want to see standard questions answered,
LMS can memorize all the answers, then that can be amazing. And also they do generalize out from that. And so there's good work on that,
but I think that if you, in my experience, building things, building something like you talk about Mojo,
where you talk about these things, where you talk about building an applied solution to a problem, it's also about working with people, right?
It's about understanding the problem. What is the product that you wanna build? What are the use case? What are the customers? You can't just go survey all the customers
because they'll tell you that they want a faster horse. Maybe they need a car, right? And so a lot of it comes into, you know,
I don't feel like we have to compete with LLMs. I think they'll help automate a ton of the mechanical stuff out of the way.
And just like, you know, I think we all try to scale through delegation and things like this, delegating rote things to an LLVM I think is
an extremely valuable and approach that will help us all scale and be more productive.
- But I think it's a fascinating companion, but. - I'd say I don't think that that means that we're gonna be done with coding.
- Sure. But there's power in it as a companion and- - Yeah, absolutely.
- So from there, I would love to zoom in onto Mojo a little bit. Do you think about that?
Do you think about LMS generating Mojo code and helping sort of like, yeah.
When you design new programming language, it almost seems like, man, it would be nice to, this sort of almost as a way to learn
how I'm supposed to use this thing for them to be trained on some of the Mojo code.
- Yeah. So I do lead an AI company. So maybe there'll be a Mojo LLM at some point.
But if your question is like, how do we make a language to be suitable for LLMs? - Yeah.
- I think the cool thing about LLMs is you don't have to, right?
And so if you look at what is English or any of these other terrible languages that we as humans deal with on a continuous basis,
they're never designed for machines and yet they're the intermediate representation.
They're the exchange format that we humans use to get stuff done, right? And so these programming languages,
they're an intermediate representation between the human and the computer or the human and the compiler, roughly, right?
And so I think the LMS will have no problem learning whatever keyword we pick.
- Maybe the fire emoji is gonna, oh. - Maybe that's gonna break it. It doesn't tokenize. - No, the reverse of that. It will actually enable it.
Because one of the issues I could see with being a superset of Python is there will be confusion about the gray area.
So it'll be mixing stuff, but. - Well, I'm a human optimist. I'm also an LM optimist.
I think that we'll solve that problem. But you look at that and you say, okay,
well, reducing the rote thing, right? Turns out compilers are very particular
and they really want the indentation to be right. They really want the colon to be there on your Els or else it'll complain, right?
I mean, compilers can do better at this, but LMS can totally help solve that problem.
And so I'm very happy about the new predictive coding and co-pilot type features and things like this,
because I think it'll all just make us more productive. - It's still messy and fuzzy and uncertain. Unpredictable.
So, but is there a future you see, given how big of a leap GPT-4 was where you start
to see something like LMS inside a compiler or no?
- I mean, you could do that. Yeah, absolutely. I mean, I think that would be interesting. - Is that wise? - Well, well, I mean, it would be very expensive.
So compilers run fast and they're very efficient and LMS are currently very expensive. There's on-device LLMs and there's other things going on.
And so maybe there's an answer there. I think that one of the things that I haven't seen enough of is that,
so LLMs to me are amazing when you tap into the creative potential of the hallucinations, right?
And so if you're doing creative brainstorming or creative writing or things like that, the hallucinations work in your favor.
If you're writing code that has to be correct 'cause you're gonna ship it in production, then maybe that's not actually a feature.
And so I think that there has been research and there has been work on building algebraic reasoning systems and kind of like figuring out
more things that feel like proofs. And so I think that there could be interesting work
in terms of building more reliable at scale systems, and that could be interesting. But if you've chased that rabbit hole down,
the question then becomes, how do you express your intent to the machine? And so maybe you want LLLM to provide the spec,
but you have a different kind of net that then actually implements the code, right? So it's to use the documentation and inspiration
versus the actual implementation. - Yeah. - Potentially.
Danger of AI
Since if successful Modular will be the thing that runs, I say so jokingly, our AI overlords,
but AI systems that are used across, I know it's a cliche term, but internet of things.
So across. - So I'll joke and say like, AGI should be written in Mojo. - Yeah. AGI should be written in Mojo.
You're joking, but it's also possible that it's not a joke that a lot of the ideas behind Mojo seems
like the natural set of ideas that would enable at scale training and inferences of AI systems.
So it's just, I have to ask you about the big philosophical question about human civilization. So folks like Eli Kowski are really concerned
about the threat of AI. - Yeah. - Do you think about the good and the bad that can happen
at scale deployment of AI systems? - Well, so I've thought a lot about it, and there's a lot of different parts to this problem,
everything from job displacement to Skynet, things like this. - Yeah. - And so you can zoom into sub parts of this problem.
I'm not super optimistic about AGI being solved next year. I don't think that's gonna happen personally.
- So you have a kinda zen-like calm about... There's a nervousness because the leap of GPT-4 seems so big.
- Sure, it's huge. - It's like there's some kinda transitionary period. You're thinking-
- Well so I mean, there's a couple of things going on there. One is I'm sure GPT-5 and 7 and 19 will be also huge leaps.
They're also getting much more expensive to run. And so there may be a limiting function in terms of just expense.
On the one hand, train, like, that could be a limiter that slows things down, but I think the bigger limiter
outside of, like, Skynet takes over. And I don't spend any time thinking about that, because if Skynet takes over and kills us all,
then I'll be dead. So I don't worry about that. So, you know, I mean, that's just, okay.
Other things worry about, I'll just focus on. I'll focus and not worry about that one. But I think that the other thing
I'd say is that AI moves quickly, but humans move slowly and we adapt slowly.
And so what I expect to happen is just like any technology diffusion, like the promise and then the application
takes time to roll out. And so I think that I'm not even too worried
about autonomous cars defining away all the taxi drivers. Remember autonomy was supposed to be solved by 2020.
Yeah. - Boy, do I remember. - And so like, I think that on the one hand we can see amazing progress,
but on the other hand, we can see that, you know, the reality is a little bit more complicated and it may take longer to roll out than you might expect.
- Well, that's in the physical space. I do think in the digital spaces, the stuff that's built on top of LLMs that runs, you know,
the millions of apps that could be built on top of them, and that could be run on millions of devices,
millions of types of devices. - Yeah. - I just think that the rapid effect
it has on human civilization could be truly transformative to it. - Yeah. - We don't even know.
- Well, and so the predict well, and there I think it depends on, are you an optimist or a pessimist? Or a masochist? - Yeah.
Just to clarify optimist about human civilization. - Me too.
And so I look at that as saying, okay, cool, well, AI do, right? And so some people say, "Oh my god.
Is it gonna destroy us all? How do we prevent that?" I kinda look at it from a, is it gonna unlock us all right?
You talk about coding, is it gonna make so I don't have to do all the repetitive stuff? Well, suddenly that's a very optimistic way to look at it.
And you look at what a lot of these technologies have done to improve our lives, and I want that to go faster.
Future of programming
- So what do you think the future of programming looks like in the next 10, 20, 30, 50 years? That alums, LLMs and with Mojo, with Modular,
like your vision for devices, the hardware to compilers to this, to the different stacks of software.
- Yeah. Yeah. Well, so what I want, I mean, coming back to my arch nemesis, right? It's complexity, right? So again, me being the optimist,
if we drive down complexity, we can make these tools, these technologies, these cool hardware widgets accessible
to way more people, right? And so what I'd love to see is more personalized experiences, more things,
the research getting into production instead of being lost in (indistinct) right? And so, and like these things
that impact people's lives by entering products. And so one of the things that I'm a little bit concerned
about is right now the big companies are investing huge amounts of money and are driving the top line
of AI capability forward really quickly. But if it means that you have to have $100 million
to train a model or more $100 billion, right, well, that's gonna make it very concentrated
with very few people in the world that can actually do this stuff. I would much rather see lots of people across the industry
be able to participate and use this, right? And you look at this, you know, I mean, a lot of great research has been done in the health world
and looking at like detecting pathologies and doing radiology with AI and like doing all these things.
Well, the problem today is that to deploy and build these systems, you have to be an expert in radiology and an expert in AI.
And if we can break down the barriers so that more people can use AI techniques, and it's more like programming Python,
which roughly everybody can do if they want to, right, then I think that we'll get a lot more practical application
of these techniques and a lot more nicher cool but narrower demands. And I think that's gonna be really cool.
- Do you think we'll have more or less programmers in the world than now? - Well, so I think we'll have more programmers,
but they may not consider themselves to be programmers. - That'd be a different name for it, right? I mean, do you consider somebody that uses, you know,
I think that arguably the most popular programming language is Excel.
- Yeah. - Right? Yep. And so do they consider themselves to be programmers? Maybe not.
I mean, some of them make crazy macros and stuff like that, but what you mentioned Steve Job is,
it's the bicycle for the mind that allows you to go faster, right? And so I think that as we look forward, right?
What is AI? I look at it as hopefully a new programming paradigm. It's like object-oriented programming, right?
If you wanna write a cat detector, you don't use for loops. Turns out that's not the right tool for the job, right?
And so right now, unfortunately, because I mean, it's not unfortunate, but it's just kinda where things are,
AI is this weird different thing that's not integrated into programming languages and normal tool chains
and all the technology is really weird and doesn't work, right? And you have to babysit it and every time you switch hardware, it's different.
It shouldn't be that way. When you change that, when you fix that, suddenly, again, the tools and technologies can be way easier to use.
You can start using them for many more things . And so that's what I would be excited about. - What kinda advice could you give
Advice for young people
to somebody in high school right now or maybe early college who's curious about programming
and feeling like the world is changing really quickly here?
- Yeah. - Well, what kinda stuff to learn, what kinda stuff to work on? Should they finish college?
Should they go work at a company? Should they build a thing? What do you think? - Yeah. Well, so I mean,
one of the things I'd say is that you'll be most successful if you work on something you're excited by.
And so don't get the book and read the book cover to cover and study and memorize and recite and flashcard and...
Go build something. Like, go solve a problem. Go build the thing that you wanted to exist. Go build an app. Go build, train a model.
Like, go build something and actually use it, and set a goal for yourself. And if you do that, then you'll, you know,
there's a success, there's the adrenaline rush, there's the achievement. There's the unlock that I think is where, you know,
if you keep setting goals and you keep doing things and building things, learning by building is really powerful.
In terms of career advice, I mean, everybody's different. It's very hard to give generalized advice.
I'll speak as you know, a compiler nerd. If everybody's going left,
sometimes it's pretty cool to go, right? - Yeah. - And so just because everybody's doing a thing, it doesn't mean you have to do
the same thing and follow the herd. In fact, I think that sometimes the most exciting paths
through life lead to being curious about things that nobody else actually focuses on, right?
And turns out that understanding deeply parts of the problem that people want to take for granted
makes you extremely valuable and specialized in ways that the herd is not.
And so, again, I mean, there's lots of rooms for specialization, lots of rooms for generalists. There's lots of room for different kinds and parts
of the problem, but I think that it's, you know, just because everything everybody's doing one thing doesn't mean you should necessarily do it.
- And now the herd is using Python. So if you wanna be a rebel, go check out Mojo and help Chris and the rest of the world
fight the arch nemesis of complexity 'cause simple is beautiful. - There we go. Yeah. - Chris, you're an incredible person.
You've been so kind to me ever since we met. You've been extremely supportive. I'm forever grateful for that.
Thank you for being who you are, for being legit, for being kind, for fighting this really interesting problem
of how to make AI accessible to a huge number of people, huge number of devices.
- Yeah, well, so Lex, you're a pretty special person too, right? And so I think that, you know, one of the funny things about you is
that besides being curious and pretty damn smart, you're actually willing to push on things and you're, I think that you've got an agenda to like,
make the world think, which I think is a pretty good agenda. It's a pretty good one.
- Thank you so much for talking to me, Chris. - Yeah. Thanks Lex. - Thanks for listening to this conversation with Chris Lattner.
To support this podcast, please check out our sponsors in the description. And now let me leave you some words from Isaac Zimov.
"I do not fear computers. I fear the lack of them."
Thank you for listening and hope to see you next time.
-----


----
Link: https://www.youtube.com/watch?v=SEwTjZvy8vw
Date: 2023.11.22
Title: # 2023 LLVM Dev Mtg - Mojo 🔥: A system programming language for heterogenous computing
Transcription: 
thank you Alex wonderful we're very happy to be here and talk a little bit about what
we've been up to so we'll start with what is mojo um at a glance the top
level points of Mojo is that it's a pythonic systems programming language so
what does that mean that means we're here to do really cool things with systems and compilers and it happens to look like python but forget everything
you know about python please please so this thing is about one year old so it's still pretty early still in development
it's still quite interesting in doing some cool stuff though um and we also have a Vibrant Community we have over
150,000 users we have a b big community in Discord and there's a bunch of excitement around this so we'll dive
today into why did we do this in the first place that's often something we're asked we'll talk about how we approach
designing a new language from scratch we'll talk about internal implementation details including some of the horrible things we did to lvm talk about what
this means for accelerators and compute and then wrap things up so first why why why why why why right
so many of you are working on AI and if you work on AI the question I will ask of you all is if AI is so important to
the world why is all the software so bad this is a huge question a huge problem
and I think that many of us that have been working in this industry for a while have been struggling with solving this problem in many different ways and
so for me when I look at this I think that the challenge is really fragmentation complexity it's all these
systems that do not work very well together that are being built by well-meaning people in different groups and areas but they don't really actually
work together and so for a user this is a huge pain point and why is this well I'll speak for myself if you're enabling
a chip you're focused on the chip so many of us are paid to solve one specific problem we're not here to solve
an industry scale problem and you can't afford to do it you don't have the time you don't have the schedule you don't have the headcount you whatever often
the organization that you're within in my experience makes it very difficult to solve some of these problems and so our
Approach at modular is that we need fewer things that work better and so
that's what led us to building modul in the first place it's really kind of an organization that can span across many
different of these problems and invest for the long term in building and hopefully lifting the industry over time
so how do we do this specifically well we're building what we call the AI engine right well the AI engine if you
look at modern ml stack a lot of folks are trying to throw layers of python on top of all this AI Tech that has been
built up we're tackling it at the hardware software boundary reinvesting no surprise in compilers and so what we
want to do is we want to unify and integrate all these lowlevel technology systems so that Innovation can happen up
on top with programming models and Frameworks and all that kind of stuff our approach is to meet people where
they are so people use Pyers people use Jacks people use tens flow that's awesome these all have pros and cons and
there's other stuff as well and very few people actually want to rewrite all their code and so for us it's very
important to be drop in compatible meet people where they are and work with their existing systems the other thing
is that this is not a research project like there's a lot of really interesting and cool things that have been built over the last 8ish years of AI
infrastructure it often gets fragmented out into all these different systems we've learned from many of them and so
what we're doing is we're pulling this back together and doing hardcore engineering not research to build a
production quality system that we hope can scale for the world I'll go through this super quickly what is an AI engine well it's really
things one is this operator graph the operator graph in the interesting case
is heterogeneous so people often focus on for example a GPU and how do I make Matrix multiplications go fast and
that's a super important problem but often folks forget that AI today is a
distributed problem it involves the host involves the accelerator involves pre-processing data loading this whole thing and so you can't really solve the
AI problem for a user unless you really tackle this whole problem and furthermore like this is really
heterogeneous like as we've seen there's all kinds of different accelerators there's all kinds of different Hardware when you have a cluster of lots of
machines like microarchitectures don't always match there's a lot of complexity in this space so many of us have been
working on this again for a long time and so we've seen the rise of Kernel libraries this is how many of these
systems were first built and one of the challenges that I won't go into in depth many of you probably already agree is
that colel libraries don't scale right and so many of us for multiple years now have been building Ai
compilers and so there's lots of these lots of different approaches online kernel Fusion lots of cool algorithms
get invented and used we can talk about all the different pros and cons and trade-offs but the thing I want to claim
is that neither of these approaches scale kernels don't scale hopefully many people understand that but neither do ML
compilers and to a compiler audience that maybe is more controversial than to Kernel audience so I thought I'd dive a
little bit into why this is and the challenges that we see with this that led us to our approach with Mojo and the
system so the first is generality right I mean empirically today ml compilers
are not very general right generality includes not just matrix multiplication again data loading pre-processing all
this stuff but also Dynamic shape sparsity there's better and worse systems out there and I mean and there's
definitely progress in this area but if you're coming at it from a user's perspective they want things to just
work and if they don't just work then they'll move on and spend their time something else generality is also
important because you know if you're again coming from a hardware enablement perspective you don't really have time
to invest in all the other parts of the problem and so it makes sense that many of us working on bring up a chip don't
actually focus on the big the big picture parts of the problem another one is community so you all are wonderful
compiler nerds you know I'd love you all obviously um and I am myself a pretty
big compiler nerd but the problem is is that nobody can hire compiler Engineers this is pretty well known and so with AI
compilers this becomes even worse because how do you hire somebody who knows compilers who knows AI modeling and all
the different exotic new model of the day who knows all the numerics and the data types and knows all the specialized hardware and how do you find that that
unicorn person that knows all of these things together it's very very difficult out there and if you need a compiler
engineer to be in the loop of Novel research there's very few companies in the world that can afford attract to do
that so I believe that you cannot have a compiler first approach to this problem
simply because there's enough Talent out there I mean I love you all and you're all very valuable but this is very
difficult particularly for the scale of what AI research is today second if you're compiler engineer it seems really
weird that we're re-encoding all of compute into IR Builders and stamping out all this stuff and so you feel like there must be a problem here at some
point finally there's this fragmentation problem if you want to solve and build a heterogeneous compute system we have to
face the reality that AI developers the researchers are in Python the Frameworks
the host side computes all in C+ plus the device side is in Cuda and sickle and other things right and so if you
want to build a system that can scale across all these different levels of abstraction there's a huge fragmentation
problem here and we need to be able to unify this otherwise we can't have one system that can reason about it and so
if you want to be able to build this and solve this problem you have to kind of come back and look at the big picture of what's going on here and the nature of
compute has changed so this is what has led us to Mojo now how did we approach building
Mojo I mean you know the outcome we'll talk a lot more about how it works but how do we even get here well when we
started modular we started with a a thesis a hypothesis right we we believe that we
could get to state-of-the-art Performance against a lot of Ender
systems and do so with a single source of Truth in our code for numerics this
hasn't really been done before there's definitely systems been around the space but this this thesis if true can can
enable and unlock a huge amount of innovation in the industry and so what we did was we said okay let's go invest
in some very fancy compiler stuff generalized fusion and uh cashing integrated distributed compilation like
lots of cool stuff let's figure out what we want to do and then let's go validate that but for validation we didn't
actually care about syntax so what did we do well we went and we actually go went and built the
thing we went and built a compiler and completely ignored syntax right why well mlr is great you can write mlr by hand
you don't need a front end and so what we could do is we could actually go build major kernel libraries and things like this and validate architecturally
we could deliver the performance that we wanted to show that the compiler worked iterate rapidly on the compiler without
having to change a dependency and go and do this and what we found fortunately is that it works the technology we built
actually is good it worked it was proven out and then immediately we figure out that writing large amounts of mlr by
hand is maddening and it doesn't scale and there's no way a real normal user could actually do this right and so but
this validation of the algorithms of the compiler Tech of the low-l system which is very novel and Jee will talk about
later was really important to building our system and doing so without being anchored on syntax I think was very good
for both Focus but also for the ability to iterate so once you get that you get to
the point of saying what about syntax right syntax actually does matter and so the three major approaches we
looked at are do we take an existing language like C++ or Swift or something like that do we do an edsl do we do a
new language and so when we were talking about this we came back to our core principles right our values our goals
which is that we want to meet people where they are and whether you like it or not AI developers but also most
software Engineers are all in Python right Python's pretty arguably
the most popular programming language in the world and so if you're coming from a python Viewpoint arguing with people
trust me I've been there to try to get them to switch to a different thing is a huge amount of work and it doesn't really go anywhere and so we realize and
believe we had to go with python and what that meant is that meant that suddenly a bunch of existing systems
were just off the table like C++ is not python Swift is not python like these things are not Python and so that really
allows us to focus our our frame what about edsls well edsls are super common
they're super popular and they exist for lots of good reasons they're relatively easy to implement we've had several talks at the conference about how to use
Python so you can you you can extract and build IR from Python ests and things like this means you don't have to build
tooling you don't have to retrain you can get to Market fast the problem is that they provide a really bad developer
experience right you don't get a debugger this really can't fit into the existing systems if you care about host
performance in generality Python's not there right at least not the level of performance that we care about and so
what we really want is we want a system that allows us to to innovate at all layers of this
stack okay well how about a new language again you know kind of where we're going with this but a new language has the
advantage of you get the best quality of result you can control everything you can invest in in things you can Target
CPUs with high performance which is quite important to us but what you need is a strong vision for what you're
trying to do you need a long-term commitment because the demo is easy but a production quality thing hard you need
to be able to pay for it you need to be able to track people you need to be able to have a big Target of developers that
makes it worth doing in the first place and so this is actually well known to be
ridiculously expensive like building a new programming language is not a simple thing that you should reach for as your
first outcome but as you know yes we wanted baby little Mojo to be built and
what we decide to do is actually do this and why well it's because it's the only way to achieve our goals to achieve the
best quality quality of result for AI developers and many other developers worldwide and be able to lift the
industry there are many point solutions that demonstrate many different capabilities but we really want to go beyond this and integrate and unify the
world and so if you come back to what we need to do we think that we have all the constituent ingredients here with a good
Vision we think we know what we're doing we also know how hard this is so I've personally built several major
programming languages that are used in production and have seen the entire journey and made many mistakes and have learned from them and so with full
knowledge we step into this and say okay let's do this so I'll give you the high level
design points of Mojo um as you know it's a member of the Python family over time it will grow into being a full
superet because we don't want to do a python 2 to3 thing anymore to python programmers as we said before it's
focused on systems programming high performance working backwards from the capability the speed of light of
Hardware definitely not working forwards from what python can do today also lots of hardware anything
with the program counter can apply um but coming back to this also and we'll talk about this a little bit it's about
unlocking the modular compiler stack and so instead of talking about the high
level fluffy stuff I'll introduce Jeff and he can tell you a little bit more about how it actually
works chis for the introduction so we are started off by De risking the core
hypothesis and we have an ml based compiler that is different a little bit from the systems that predated it and
we've proven that we can beat state-of-the-art the problem is that we've got like 50,000 lines of handwritten ML and
handwritten ml is like right once read never it's soose you have to write the
types every time you use an SSA value it's pretty hard to actually write incorrect code but then it's not
readable it's unmaintainable and the new people being brought into the company are like what what is this so we need
syntax we need a programming language for ML um why all ml well it turns out that
modern computers are getting really complicated modern types are getting really complicated look at just floating
points most languages give or take have a float in a double but M has things like floate E4 M3 F I'm sure it's useful
okay and that means that we need to have access to it there's probably a piece of Hardware somewhere on it that uses this data type and it's very fast um that's
just the tip of the iceberg em is such a vast ecosystem with many different kinds of Hardware targets domain specific
dialects and so on and we would like Mojo to be able to take advantage of all of that so we need syntax sugar for ml
in general but then how do we approach something like that well we start with the types in a programming language
types tend to be the most loadbearing element you need types to do computations on them after all so let's
start by focusing on a library based language that means that we write all the parts of the language in the library
and the good news is anybody can write libraries so this scales the e e of engineering to everyone in the world who
can write Mojo not just a couple of people who work on the language and that's really important because we don't want built-in types in the language to
be special or be more performant than what you can enable in the library because that bottlenecks performance and
the scalability of the system to the people who work on the language so we need to give Lang we need to give people
who use the programming language Library authors the same power as language Engineers um it turns out actually that
python has a really extensible type system You could argue that userdefined types in Python are actually much more
powerful than the built-in types like inter float and the reason is because python provides this kind of ability to
encapsulate type semantics behind Thunder methods which are really syntactic wrappers so let's just use
that in Mojo right we use a struct which is like a class but it's densely packed in performance to wrap an ml type and
then we use Dunder methods as well as class methods to wrap mlr operations and
what you get is any mlr type will work any mlr operation will work and so now
we have 1 plus 2 dgar to mlr op index. add the other important aspect is we
need to make sure that these userdefined abstractions feel native that they're zero cost so how do you how does moo do
that well it has a couple of bells and whistles to tell the compiler that treat this type in a specific way effectively
giving a built-in like experience and one of these is say always inline no debug which will always inline the
function no question about it and for a better debugging experience it nukes out all the debug info so you don't step
into a plus of an integer so if we put this all together just this pieces of basic types so you
have a simple while loop in Mojo well the par will then spit a bunch of source level IR right but then Mojo has
guaranteed optimizations that run all the time such as the always in liner and M and then this gets desugared down to
IR that is pretty close to what we would have written by hand and that's important because it from the get-go
provides a predictable IR gen model for the programmer and it helps us get an offramp from all the handwritten
ml but so it turns out we've actually discovered what ml really stands for uh
it's Mojo fire Emoji language intermediate representation and the best part is your
dialect works too so this is zero cost substraction around any ml so let's say you have a shape dialect with a mos.
type and it implements plus to concat and subscript to get dim well now you
can write shape functions in Mojo it spits out some IR that's been desugared to and then you can ingest this ir and
do cool compiler stuff like shape inference and the best part is all of the language tooling just works so you
get code completion you get doc generation you get syntax highlighting and even debugging if that's
relevant but ml just forms the bottom level of the language it's how we talk to the hardware it's how we talk to the
various dialects building on top of that requires high level abstractions and the way you do that in Mojo is
metaprogramming so Mojo needs to build hardware generality and the way we do that is with metaprogramming so you can
write a kernel without caring about what the vector length is and then say in this example ask the compiler to pick
one for you it turns out that meta programming is also pretty cool uh generics are nice code reuse is great um
and it allows to have scalable development so where can we look at for metaprogramming system well I actually
like C++ I don't know about you and C++ has templates and duct typing in C++ is
really powerful let's you write some pretty crazy generic code the problem with that is that the usability is poor
I think template error messages get better every year but there's still some room to go and it turns out that for the
kind of metaprogramming high performance programming needs C++ templates just aren't good enough so imagine you have a
tensor type it has a static or dynamic rank it has a static or dynamic D type it has partially Dynamic shape partially
Dynamic stride it gets ugly pretty quickly so it's not good enough and let's see if we can build something
better so it turns out once again python actually has really powerful meta
programming decorators can arbitrarily modify objects and you know return a function where there is a type and it
with full a reflection in Python is what enables all these crazy libraries such as the ml Frameworks like pytorch
Jackson tensorflow as well as things like Numba the problem with the python metap programming is that it happens at
runtime which means it's slow it's not going to run an accelerator and it give us zero control over the generated code
so the challenge for us is let's try to do it at compile time so that brings us to modjo parameters modjo parameters are
compile time values that form the backbone of the meta programming system so structs can have parameters these are
compile time values functions can have input parameters and then you can declare name parameter values with Alias
declarations so you can kind of think of them as being like C++ templates but they're a little bit different for
example in C++ you have using declarations for type ilas and conexs for declaration for compile time values
but em Mojo types are just compile time values and so aliases and say compile
time floats and compile time ins are the same thing the most important thing that
gives is that the meta language is the same as the actual language and Zig really Blaze the trail here by having no
distinction between the meta program and the actual program and Mojo we strive to ensure that almost any user defined type
and function can be used and called in a parameter expression at compil time and the way we do that is with an mli
interpreter that has a full memory model so to really drive this point home
we have an example here it's Phil a vector with a bunch of integers okay not too bad this function can be called an
either compile or runtime and you know if it was compile called a compile time you can even return a type instance and
this Vector has Heap allocation that is computed at compile time and then Ed that
runtime so when does this happen when do we do say instantiation of parameter values function specialization and
interpreting of code well it doesn't happen in the parser like in C++ so in Mojo we do parameter instantiation in a
process called elaboration and it happens later in the compiler pipeline what that means is that now Mojo needs a
IR representation for parametric code so in this example we have a piece of ir and we have a parameter in the IR called
value importantly this parametric IR is Target agnostic it's portable so that
means something like size of lives directly in the IR and it is resolved by the elaborator so this enables something
like split compilation like Cuda and perhaps one day separate compilation of generics like
Swift so the elaboration pass is an ml pass that performs function
instantiation as an IR transformation so in this piece of ir we've got two calls
the function print int with two different parameters they get Stamped Out into two new functions and the callers are replaced
appropriately um one consequence of a pass to do elaboration is that the
language is late Bound By Design uh that poses a couple of language design challenges but that means that you can
do cool stuff like autotuning where any parameter value can be autotuned I.E the
elaborator says oh okay width can be 2 4 8 16 or 32 let me just go have five
instantiations of this function and then use some benchmarking to pick the best one for you so this is how we
get the very bottom layer of Hardware abstraction where the programmer can write an algorithm and then we let the
programming language pick the best parameter for you and this also allows us to avoid
some of the performance problems with C++ templates for example let's see you have a generic function add and for
generality we pass the arguments by con reference passing it by const reference is fine for a large struct type thing
that doesn't fit nicely in registers like a string but then for something like an integer this ends up becoming
con reference to an INT which for a trivial type like int is not very performant and so if this function
doesn't end up getting inlined what ends up happening is the inss get pinned to the stack this is bad for
performance with late elaboration in Mojo we can have late Avi low ring which basically means that the source code is
not the same as the ABI and this you know makes language interop slightly more involved but it's not big of a deal
but what it means is that for a generic function like add in Mojo when the elaborator instantiates the generic
types it can then change the callon conventions of the types to respect the guarantees uh that it has so for a heavy
type like string it stays in memory it gets passed around as a pointer it's nice and efficient but for an integer it
gets passed around in registers in SSA registers and returned out as a function
result so that's just an introduction to how Mojo meta programming Works let's talk now about more how the coent
architecture works and some of the more unique details of that one of them is that the entire Mojo compiler stack is
driven by the orc jit from bottom to top and this gives us lazy OnDemand compilation so you don't compile things
you don't have to it enables responsive tooling and turns out that having a jit is important for something like autot
tuning and search and we get compiler caching at each stage of the pipeline
meaning that you don't need something like ccache to get code compilation
caching uh well we also use orc jit not actually
as a jit uh we use it to generate static code like static archives and executables and in the OR jit we've
built a really dumb but fast Linker that just takes a bunch of object files pulls out the symbols and slams slams them
together into a static archive for a Linker we do call into the system Linker was we mentioned before we have a
pre- elaboration portable IR but that also means that we can ser I this into mlr B code and that makes Mojo packages
architecturally portable a Mojo package will contain this parser level Source level IR as well as the pre- elaboration
ir and optionally you have the post- elaboration and pre-compiled code for various targets so what this means is
you can ship Mojo packages without source code with just the bite code the parser is able to take out this Source
level ir and reconstruct metadata like function signatures and type members and
so on and with optimized and pre-compiled code in the packages Mojo packages become like portable build
caches so if you're on a common system like an M1 Mac and you pull a Mojo package it will probably already have
the pre-built code for you so what is a compilation with a package look like well if you start by
importing a function from a package the parser goes and reads out the Declarations from the package it will
then lower into the full pre-abortion ir and the reason why you need the full parametric IR so that you can instance
the function again and so that the elaborator can call The Interpreter on pre-compiled code during elaboration we
don't reoptimize and ranti all the functions we just drop them out with the
post post elaboration IR into the ml module so that gives us lto and ml but I
mean ml is pretty far away from link time but it's a similar idea but we actually trash these pre-compiled
functions out of the IR before we go to llvm and that has some interesting implications so Mojo is a bit of an
usual probably slightly controversial user of of llvm so llvm is fantastic we love lvm we
love everyone here but it's uh got a couple of issues the most standout of these is that it's single threaded and
what that means is on a modern system like an AWS 192 core machine you get arbitrary slowdown for compilation
speeds you only use one core the other problem with lvm has got a couple of passes that don't tend to be strong
enough for our use cases and that are difficult to control and predict a lot of the stuff in lvm was built for
something like clang but in Mojo we'd really love to be able to autotune and unroll Factor the good news is the m is a thing
so let's focus on the excellent strengths of lvm lvm is great at stuff like scalar optimizations from inst
combine and other function level optimizations like Loop strength reduction we ended up disabling passes
like the vectorizer the loop un roller and even the inliner as well as a couple of the other IPO passes and the solution
is to replace them in ml where we get inass Paralis and push many of these
optimizations out into the library which is something Abdul will talk about in a bit so what happens when you get rid of
all the IPO passes well you get to use LM as a per function code generator this gives you full Coden parm at a function
level across the entire stack and what that means is that pretty much the entire Mojo compiler pipeline is fully
paralyzed except for the linger and the parser parser could be paralyzed one day um and that's really just the tip of
the iceberg and what we could fit into one presentation there's so much more to Mojo and there'll probably be more talks
coming in the future but for now I'll pass it over to Abdul to show you all how to write some fast code in
Mojo So going back to what Chris said at the very beginning we had a hypothesis
to begin with we want to write fastcode that's why Mojo was written to begin with we wrote things when m we've proven
a lot of the tech L's right things in Mojo and let's show the performance so
let's step back how does existing performance libraries how are they built
today well the short answer is whatever it takes to get performance there's no
you know style guide or anything like that that's usually um like maintained
and that also means like there's a lot of suffering because there's lack of tooling Etc so what people do is they
write things in assembly oh great you know but please don't it's not a super
productive programming language others build compilers as C++
templates and God forbid you know you mess like one of the sevens becomes a
six and you get some nasty error message others build C++ DLS that
generate asms others write python programs that
generate assembly others write python templates
that generate C++ templates that then you feed into client and these are not like research
projects these are production libraries that are used today you probably used one already these are you know by the
big companies and as a result you're kind of losing a lot of things you lose on
maintainability debugging tooling and becomes hard to develop and iterate on
these performance libraries and that's why they call them performance ninjas right you lock them in a room give them
some coffee and then they give you speed up and we don't want to do that we want
to reduce suffering the other thing is what happens is these performance libraries are pre-built and shipped as kind of you
know black box binaries and what that means is you've encoded when you built
ahead of time you've encoded all the hardware semantics tile factors Etc in
the library you've made it into a blackbox so other higher level uh things
in the stack like a graph compiler cannot reason about uh what the library is doing you've also encoded like
specialized patterns popular things like a resin up block or a Transformer block
into your library and what happens if there's a you know Transformer version two or resonet you know 53 you're kind
of screwed in in that domain there's other things like there's no consistent API there's Bloss there's
Bliss there's one DNN Etc and the distribution story is even worse there's
a 1 DNN and then there's a Zen DNN but then if you are on arm you have to use you know something else as well so we
want to solve all of these things and that's the reason why we built Mojo we built it to solve our problem of writing
high performance libraries and the first thing we want to make sure is the developer is
happy and they have all the tools that they need to be productive so rather than as kind of Chris mentioned a lot of
developers are not compiler Engineers you know they can write libraries they probably cannot go and you know write a
pass and so on so let's put optimizations in the library and I'll have some examples later on let's also
Leverage What computers are good at so when I was in grad school a lot of of
grad students were essentially you know grid Searchers they would just enumerate everything try 50 things you lock them
again in a room for a month and they say oh the best tile factor is six and four
and so on let's not do that let's use computers computers are great at these sort of things they can scan things you
can do smart searches and so on so let's use autotuning let's use algorithmic selection and let's build that in the
language and let's make sure that we have tooling to make these people productive debuggers how do you like how
do you debug the python template that generates C++ template that you know does something else it's it's it's hard
to begin with to debug C++ templates let's Al also build like a
language that's aware of like the 21st century so Sims are a thing so let's be
you know simd first let's have scalers to be a generate form of simd of simd of length one and make the simd parametric
let's also make the library the one we ship the standard Library you know have
first class support for simd types also multie is a thing so let's build
parallelism and asynchrony into the language as well and finally you know we can have
these nice things but sometimes people are like I want my assembly back or I
want to use the lvm intrinsic well all of this is built on top of ML and lvm so
you you can get any of the intrinsics that you want uh you can reach into them
you can also write inline assembly which is kind of interesting given that you're in a python you know syntax
language and you can Target any llvm backend so we're not like we're standing on the shoulders of giants so we're
leveraging all lvm and M back at infra to do that let's also not build a DSL so
even though you know some of our use cases is AI the programming language should be General I should be able to do
you know some operations in Mojo but then do the plotting uh through our
python integration and that requires a general purpose programming
language so one of the things that we made a decision on is let's make the you know kind of compiler lean and let's
move a lot of the optimizations and the infra to be you know kind of functions in the
uh in the moo Library so we use very limited number of dialects in M cor and
I know this is might be controversial so we're not using vector arith linal or
any of these dialects mvvm any of these dialects we're only using the lvm and index dialect and there's a bunch of
reasons for them sometimes they're not General enough sometimes they don't fit in our use case they bring in a lot of
code that we don't care about and there's like you know you know for the lack of better terms sometimes like cylic dependencies and so on and we you
know having a lot of the functionality in Mojo code means you could iterate a lot more quickly so let's like Implement
something like a vector dialect type of thing in Mojo So we have the simd type
and we have a function called reduce Max and in you know if the size of the width of the simd vector is one we're just
going to return the scalar directly if we're on x86 it ends up like there's a you know lvm has an instruction for
horizontal Edition or horizontal Max that's not great for uh Intel so we
could do a kind of a tree reduction thing but if it's floating point we use
a different algorithm and we call directly to an lvm intrinsic this is compared to you know
how the vector dialect lowers you're writing essentially the same stuff minus the special case for x86 in essentially
C++ code to allow our directory to the lvm dialect we could also do similar things
like transforms so as Jeff mentioned we disable the lvm vectorizer and instead
we have folks be you know kind of opt in to the vectorizer and we've implemented
a vectorizer in you know these like five lines of code so in one case we are
going to we've parameterized the function on the simd width and we're going to call it when you know for the
specific simd withth and the leftovers we're going to call the function with a value of
one so what does this mean to the developers it means that when you're trying to do an optimization when you're
trying to add a new feature or Target a new hardware the first thing is not oh I'm going to need to write a dialect or
I'm going to reach into table J the first thing is I'm going to reach into Mojo and I'm going to do experiments and
so on you can invent new optimizations weird ones incorrect ones or maybe even
point optimizations that only works in this function in this domain in this
context this is all fine but I care about performance I'm also a compiler
engineer but I ultimately I care about performance so let's look at the performance of Mojo So one thing that people anchor on
is the mandle BR set the mandle BR set you know we have a blog post that was
recently published but essentially at the end of the blog post you end up with this like 10 lines of code and if you
run this 10 lines of code you get 68 times 68,000 times faster than
Python and you can kind of see the progression you know you can look at the uh blog post uh you know after this
presentation there's a progression how to go you know to 90x faster all the way to 68,000
faster and but at the end of the day this is the code that you're going to see but nobody cares about mandal bro
you know you can there's ways to cheat in mandle BR we're not cheating here but nobody cares about mandle BR so let's
solve a hard problem so let's look at matrix multiplication so matrix multiplication has been studied since a
lot of us have been born there's also a lot more papers that were published this
year about you know matrix multiplication it's also difficult you know the problem is dependent on the
cache size and microarchitecture so also core part part of La Pac and you know
the ml system which means Hardware companies to go in the top 500 supercomputers they have to optimize
matmo or to be on the top of the ml perf they need to optimize MMO so a lot of
effort goes in to you know optimize maal and these libraries have been
developed for decades you know before some of us were born as
well but we also don't want to write you know the python template that generates C++ template that you know
maybe goes to python again and so on uh let's be principle so let's have a few
kind of core things that we want from our maal we want a single source of Truth we don't have multiple F we don't
want to have multiple files we want to have one implementation we want it to be as fast
or competes with state-ofthe-art you know even though you know we can read assembly and we can program C++
let's not do that let's write everything in Mojo let's make it you know fusible
and do fancy stuff support Dynamic shape work on multiple architectures Etc our
core hypothesis from the very beginning and here's what we ended up with so this is again a blog post from a
few months ago uh we're actually faster than this now but we can compare against the best in class on their Hardware so
we're 1.4x faster than Intel uh on you know skyl systems and this is fully
Dynamic we're not specializing on shape we're not doing prepacking we're not you know I wish we were doing tricks uh it's
easy to get these results if we were doing tricks but that's what we're doing we have no inine assembly and let's like
run the same code but now on Intel or sorry on AMD 1.6x faster do the same
thing but on arm or 1.2x faster in fact like you know our
implementation is about 2,000 lines of code this is a toy implementation but this is putting everything together the
interesting thing thing about this toy implementation is this is what the Llama moojo uh there's a public GitHub repo
that's using this and this implementation beats using this they are beating the Llama CPP
implementation that's public so with that we've validated our
hypothesis you can build you know portable uh performance libraries with
less suffering and with that I'm going to hand it off to Chris
good awesome so to wrap things up um Mojo is still early in development as we
talked about there's still a lot more that is yet to be done um one of the things we're doing that's uh I think pretty cool is we're developing this all
in public and so we have a road map you can go see what we're doing we have new releases that come out very frequently
now one of the questions we get asked all the time is does a modular open source anything right and so the answer
is comes in two fold one is yes we have Upstream stuff all of the time including tons of core improvements to ml um
apparently the The Interpreter that Jeff was talking about on Tuesday is very popular and so we can work on that and
so we're very like good open source systems from that respect Mojo itself we
I think we'll take a little bit longer but we want to start the Open Source process later this year and so we'll start working on that now I expect that
to take some time because we want to make sure that we get the core design really right and not everything is best
done with designed by committee but we really want to see this thing scale and go and have a big impact for the
world so coming back all the way to the beginning we talked about Ai and the AI engine and this kind of stuff now we
don't have time to talk about it today but the cool thing about what Mojo means for the AI engine is that you can
actually tackle these heterogeneous compute problems because you can finally scale across lots of different hardware
and this is really cool don't have time to talk about it today if you're interested we have a keynote at the nurs
conference later this year where we'll talk a lot more about this in detail so that I think that's the end of
our talk and we're very happy to take any questions if You' like to check out Mojo you can go to the web page read about it download it and use it today
thank [Applause]
you thank you Chris Abdul and Jeff are there any questions you have miks in the
LA good time yeah thanks um thanks
for test test thanks for the great talk my question is I haven't seen anything
about uh GPU offloading in in your slide is that in in plan or what what are you
uh intend to do with it so there is one bullet point actually on that there's so much more and yeah Mojo does actually
support uh like GPU offloading and split compilation like Cuda but it's something that we did not talk about in the
presentation and sure would Shar like to talk about in the future yeah thank
you um hi um you mentioned that uh you don't need to use ccache because um you
kind of mentioned that like can you elaborate that a little bit like how you guys dealing with caching so it turns out that ml has a nice serializable
format called bite code and but bite code provides a predictable hashing and so we can use mlr bite code as the form
to hash and cache compiler Transformations across the stack okay thank you so we also didn't have time to
talk about but there's a whole distributed cast backing this thing and there's a whole bunch of fancy stuff put
into it hi uh how are you doing the autot
tuning is it offline or is it dynamically online and how do you define the objective function for the search
yeah so you have a choice you could do it offline or online if you compile to like file you've done it offline uh the
objective function right now is something that the user provides because it's data size dependent you know
Hardware dependent and so on so it's up to you to Define that we do provide a
benchmark module so that it makes benchmarking a lot simpler uh and that
allows you to do that yeah uh if you're doing it online how do you control for like variation in data or do you rely on
so The Benchmark library that we provide has you know good uh like you know number of iterations and
so on until you get stability and so on so it it handles that Al so it's not actually in production autot
tuning we use autot tuning today so I don't know what for that yeah so I mean
there's core capabilities then there's future stuff also I mean one of the things that it's designed for but we haven't actually done is the like send
the IR to an fpga and do evaluation remotely and then pull it back and things like this or or a simulator yeah
exactly yeah a great talk uh there was a point
in the slide about uh optimization in the providing optimization in the library as as opposed to the compiler
are there any uh maybe I misunderstood this but I
from my understanding it it's possible to come into like performance pitfalls because C++ has uh built-in likely built
in unlikely and then you can it's really easy to misuse those and end up in a
situation where your code is slower than without without these kinds of annotations so my question would be what
happens if a user provided annotation conflicts with something that the compiler would also have done at the
same time uh well so from a compiler design perspective one of the things jefff was talking about is we've removed
not all but a lot of the super unpredictable things in the lvm optimizer so our goal is to give full
control and predictability to the programmer which is very different from the make spec go fast
kind of approach to compiler design and what that does is that gives you the ability to then go and design Library features that do things like you know
you can Abdul you can talk about some of the crazy stuff you've done but what's also important is that um we have these
abilities to say please vectorize this Loop please unroll this Loop and so on but not everyone who's writing say
application code is going to think about vectorizing every single Loop and autot tuning every other loop so what's important is that we provide control to
the users who care but also provide a default called experience that is like
good and optimal and the compiler does its best but the important thing is what the user says will always take precedent
and that's how you get control sometimes a compiler does things and you end up with code that says you know optimize
you know compile the section of code with Dash o z type of stuff and you kind of want to opt out of compiler
optimization because it's interfering with how you laid out your code um uh
are there any plans I I have a followup question sure come after uh last
question please uh hi uh so you mentioned that uh you only use two dialects uh in Mojo llvm and um index
dialect two Upstream dialects two up okay so so so you don't use other things like f fine and stuff which means that
if you want to use Hardware specialized libraries then the programmer has to do
different tiling for ampere versus Hopper versus Volta and so on so isn't
that just pushing the burden out from the compiler and high level stuff into the into the programmer you're going to
that's exactly what that is very Hardware specialized performance libraries and then people who write this
thing would have to understand the architecture really really you know well I think the thing is that they're more
likely to understand the architecture really well than the compiler engineer right the compiler engineer has
to have two things writing C++ for on CPUs that Target gpus this is like okay
I'm a Cuda programmer I'm laser focused let me I see the trade yeah so that means that the people writing high
performance libraries for very specialized accelerators they need to be experts at those accelerators right okay
right so they need to be expert in one area not two areas so the go give a kernel programmer superpowers okay right
but um but that's that's that's our approach to it as Jeff talked about Mojo can talk to any dialect if you want to
you can use aine in Mojo we can plug and extend the system with dialects as well so so that's always an option okay so
that a conscious decision is what I'm that's the that's really the conscious decision you're making is that you going to get experts to do the the performance
library and they will just work well so so this is the thing design
it colonel libraries don't scale because of the magnitude of the problem that and the cross product of all the different
Integrations and all the stuff that chronal libraries struggle with but there are more Colonel programmers and
performance Engineers than there are compiler Engineers by far sure right and so and okay so it's really about
enabling the the talent that actually knows how to do all this kind of stuff versus having a compiler engineer in the loop that becomes a bottleneck okay
thanks and we'll be around as well like throughout the conference so feel free
to yank any of us thank you Chris Abdul and Jeff let's thank the speaker
again

Additional: 
34 188 wyświetleń 22 lis 2023 [2023 LLVM Developers Meeting](https://www.youtube.com/playlist?list=PL_R5A0lGi1AD9nPVlv7mG8_2mMSiL_0Ik)

2023 LLVM Developers' Meeting [https://llvm.org/devmtg/2023-10](https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbUdXTkxxaDhCZmk4U3RhUVJOeXlvSlNQY2RzQXxBQ3Jtc0trckZBSjh4WWllcTlSVk5weVJTdndrQVRNTlQtcUFfcEppeVV6Z2Y2cXMzaU54TWFWak45U0RfTFpvN0hKYXF1Z29aSFRjcVJNU2VRcm1fUFBwbUxDSFQ1bVhyVHNuZ2w2RFE4a09mNmU3NFZXbHdVZw&q=https%3A%2F%2Fllvm.org%2Fdevmtg%2F2023-10&v=SEwTjZvy8vw) ------ Mojo 🔥: A system programming language for heterogenous computing Speaker: Abdul Dakkak, Chris Lattner, Jeff Niu ------ Slides: [https://llvm.org/devmtg/2023-10/slide...](https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbC1lclVDZ0xOWE9Tb3NLSGxIVlJzZWRVNkhod3xBQ3Jtc0ttSUR5cHV1OVZnTjVDSlZ1dG1wczBWUlJMOE4wM3lOM3BVRnQ0cGxMNm9KY3ZGX0dUcC1ZalI1LTZGaWthclJ5cV9VTktKZ0kxR3pTUm8tMmxXT0hzMmNGZVlmeU8xd0VnUGhpdnAwdXN3UXBveFpwZw&q=https%3A%2F%2Fllvm.org%2Fdevmtg%2F2023-10%2Fslides%2Fkeynote%2FMojo.pdf&v=SEwTjZvy8vw) ----- This talk will give an overview of Mojo 🔥, a new programming language in the Python family built on MLIR and LLVM. Mojo aims to bridge the programmability and performance gap in systems programming by combining Python’s ergonomics and ecosystem with C++ and CUDA-level performance into a single language. We will describe how Mojo leverages the MLIR and LLVM infrastructures to provide meta-programming, user-defined code transformations, hardware backends, adaptive compilation, and auto-tuning to enable developers to achieve performance without sacrificing programmability.


----
Date: 2023.05.04
Title:  [Mojo Lang… a fast futuristic Python alternative](https://www.youtube.com/watch?v=V4gGJ7XXlC0)
Transcription:

It is May 4th 2023 and you are watching the code report python is a wonderful language for productive programming but it has one big problem it's too slow and going slow means you'll get made fun of by the rust and C plus Chads of the world but the tables are about to turn thanks to a brand new programming language called Mojo a superset of python that's not just two times faster not ten times faster but up to 35 000 times faster than your grandpa's Python and that's a huge deal because Python's the dominant language for artificial intelligence but behind the curtain anything that needs to go fast is written in C or C plus plus in today's video we'll take Mojo for a spin but first here are five things that you need to know about it one this is not some random guy's side project on GitHub but rather it comes from a company founded by Chris lattner the guy who created the Swift programming language and the llvm compiler tool chain if anybody could fix Python's problems it's him and if you have no idea what llvm is check out this video two it's a language designed for programming on AI Hardware like gpus running Cuda and other accelerators it achieves this by Leverage multi-level intermediate representation to scale to Exotic Hardware types without a ton of complexity and it even has built-in Auto tuning to optimize your code for your Target Hardware three it's designed as a super set of python in the same way typescript is a superset of JavaScript so you don't need to learn another language to take advantage of it and this is unique compared to other modern systems languages like rust Zig Nim and so on which would have a higher learning curve for existing python programmers it does have a bunch of features on top of python like VAR and Lut declarations and structs but the base language is fully compatible with python and it can also interop with the python ecosystem which means you can still use your favorite libraries like numPy pandas Etc or it adds strong type checking to the language you can still use Dynamic types if you prefer but static types are essential for optimized performance and error checking for memory management it has an ownership system and borrow Checkers similar to rust and also supports manual memory management with pointers like C plus plus it's a pragmatic language that gives you safety but also the flexibility to be unsafe when needed now the final thing to know is that currently it's not available to the public it's still in very early development it will be open sourced in the future but currently there is a wait list to try it out I was lucky enough to get Early Access so let's fire it up to run it you can create a file ending in dot Mojo or dot fire Emoji that's a huge advantage over python which doesn't allow you to name your files in dot snake but we can also run the code in a Jupiter notebook where it behaves like an interpreted language here we have a matrix multiplication demo that computes a DOT product to demonstrate the crazy performance gains we get with Mojo first it benchmarks a basic function in Python then by simply importing that code into Mojo it's executed 14 times faster with no modifications to the code but we're only just getting started we can further optimize this code by adding types to the python implementation Mojo allows us to do that with its built-in struct keyword a struct is very similar to a python class but structs are static unlike classes which are Dynamic inside this truck we ALS have keywords like VAR and let which can Define mutable and immutable variables and Def is replaced with FN which is a stricter type type of function also notice single instruction multiple data which is a built-in type that represents a vector where a single instruction can be executed across multiple elements in parallel on the underlying Hardware once we have this struct we can then use it as a type in the python implementation then when we Benchmark the code again we get a ridiculous 500x performance boost but we're still not happy yet in the Inner Loop we can query the vector width instead of hard coding it and that gives us a thousand X gain but that's nothing compared to what we're about to do linear algebra is perfect for parallel Computing and we can easily make our code multi-threaded with the built-in parallelized function increasing our speed buff to 2000x but now I've got a fever and the only prescription is more performance luckily Mojo has built-in tiling utilities that basically allow us to cache and reuse data more efficiently and we can even auto-tune it to find the optimal parameters for our Hardware the end result is over four thousand times faster execution compared to the original python code that's pretty crazy and if you want to see this code broken down in Greater detail I'd highly recommend this video from Jeremy Howard but I'm curious is what you guys think do you really think Mojo could kill Python and C plus at the same time I'm a bit skeptical but employers are already hiring Mojo developers with 10 years of experience this has been the code report thanks for watching and I will see you in the next one

Comments:
The provided comments present a range of perspectives and sentiments regarding the Mojo programming language. They cover various aspects like language performance, developer experience, industry adoption, language features, and potential implications for the AI and ML development landscape. Let's summarize the notable points and remove any redundant or less meaningful comments:

1. **Industry Adoption & Experience**:
    
    - There are humorous mentions of the industry's demand for "Mojo devs with 10+ years of experience" despite the language's recent emergence.
    - Several commenters express eagerness to work with Mojo due to its promising capabilities and the potential for a new standard in AI/ML development.
2. **Performance & Efficiency**:
    
    - Many highlight the significant performance improvements with Mojo, especially in comparison to Python. Comments mention potential 14x speed improvements and successful integration of features like SIMD for performance boosts in matrix operations.
    - A few are skeptical about the performance claims and anticipate that as Mojo grows, it might face challenges similar to those encountered by other high-performance languages like C++.
3. **Language Features & Developer Experience**:
    
    - The blending of Python's syntax with the performance of lower-level languages like C/C++ is well-received. Commenters appreciate the simplicity of Python with the added type safety and performance optimizations.
    - The introduction of Python-like productivity with enhanced performance and a strong type system is seen as a unique advantage.
    - Some express concerns about the potential complexity and readability issues that might arise with the introduction of strict typing and other low-level features.
4. **Comparisons with Other Languages & Technologies**:
    
    - There are comparisons with existing technologies like Numba, Cython, and Julia, questioning Mojo's unique advantages over these established solutions.
    - Discussions about Mojo's potential impact on other languages and its position in the language ecosystem, with some speculating about its ability to compete with or complement languages like Python, C++, and Rust.
5. **Industry & Community Impact**:
    
    - There's optimism about Mojo's adoption in various domains beyond AI and ML, including game development, numerical computing, and scientific computing.
    - Concerns are raised about potential fragmentation in the Python community and the challenges of transitioning from Python to Mojo.
6. **Future Prospects & Expectations**:
    
    - The community expresses high expectations for Mojo's future, hoping for robust documentation, compatibility with existing Python libraries, and real-world performance that matches the advertised claims.
    - There's a desire to see more in-depth comparisons between Mojo and other high-performance languages in practical, real-world scenarios.

The comments collectively reflect a community that is cautiously optimistic, curious, and ready to explore the potential of Mojo, while also being mindful of the challenges and realistic about the incremental nature of technological progress.

---


