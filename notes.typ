#import "@local/probonotes:0.2.1": *
#show: style.with(
  // Title and subtitle
  course-name: "Abstract Algebra",
  course-code: "SF1678",
  author: "",
  date: none,
  title-size: 30pt,
  subtitle-size: 16pt,
  title-space: 0em,

  // Layout
  size: 12pt,
  margin: 0.5cm, // 0.5cm for computer, 0.1cm for phone.
  width: 14cm, // 14-16cm for computer, 8cm for phone.
  height: auto,
  end-space: 40em, // 40em to cover computer screen.
  heading-break: false,

  // Content
  language: "en", // sv for Swedish.
  contents: true,
  memes: true,
)

= Sets

#definition(title: [Tuple])[
  A tuple (or sometimes _list_) is
  a finite, ordered collection of elements,
  possibly with repetitions.

  An $n$-tuple is a tuple of length $n$.
]

=== Morphisms

#definition(title: [Map])[
  Subsets of the Cartesian product $A times B$ are called _relations_.
  A _map_ is a _well-defined_ relation written
  $
    f subset.eq A times B
    quad "or" quad
    f : A -> B
    quad "or" quad
    A ->^f B
  $
  and is
  - _surjective_ or _onto_
    if $f(A) = B$,
    which is equivalent to being _right invertible_
    with $f compose f^(-1) = id_B$.
  - _injective_ or _one-to-one_
    if $a_1 != a_2 ==> f(a_1) != f(a_2)$,
    which is equivalent to being _left invertible_
    with $f^(-1) compose f = id_A$.
  - _bijective_ or a _one-to-one correspondence_
    if both above apply,
    which is equivalent to being _invertible_.
]

#definition(title: [Endomorphism])[
  Let $X$ be some mathematical object.
  A map $phi : X -> X$ is an _endomorphism_.
  Should $phi$ simultaneously be bijective
  it is moreover an _automorphism_ and, if $X$ is a set, a _permutation_.
  The most trivial automorphism is the _the identity map_ $id_X$ with
  $ id_X (x) = x wide forall x in X. $
]

#definition(title: [Homomorphism])[
  A _homomorphism_ is a map between algebraic structures
  that preserves the structure.

  For example, a group homomorphism $f : G -> H$ satisfies
  $ f(a * b) = f(a) * f(b) $
  for all $a, b in G$.
]

// Beware! Im unsure about this
#definition(title: [Isomorphism])[
  A map $T : V -> W$ is an _isomorphism_ if it is
  + bijective and linear or, equivalently,
  + invertible.

  If such a map exists, the spaces are _isomorphic_,
  written $V tilde.equiv W$.
  Then the spaces differ only in their respective choice of basis.

  If $V = W$, then $T$ is an _automorphism_.
]

#definition(title: [Kernel])[
  Let $T : V -> W$ be a linear map.
  The _kernel_ of $T$ is
  $ ker(T) = {v in V | T(v) = 0}. $

  The kernel is a subspace of $V$.
]

=== Equivalance

#definition(title: [Equivalance Relation])[
  An _equivalance relation_ on a set $A$
  is a relation $R subset.eq A times A$
  with the following properties:
  + / reflexive: $(a, a) in R wide forall a in A$
  + / symmetric: $(a, b) in R ==> (b, a) in R$
  + / transitive: $(a, b), (b, c) in R ==> (a, c) in R$

  If $(x, y) in R$ we write $x tilde y$.
]

#definition(title: [Partition])[
  A _partition_ $cal(P)$ of a set $A$
  is a collection of non-empty, disjoint subsets of $A$
  whose union is $A$.
]

#definition(title: [Equivalence Class])[
  Let $R$ be an equivalence relation on a set $A$.
  The _equivalence class_ of $a in A$ is
  $ [a] = {b in A | b tilde a}. $

  The set of all equivalence classes is written
  $ A slash.double R $ and is called the _quotient set_.

  The equivalence classes form a partition of $A$.
]

#definition(title: [Quotient Map])[
  Let $R$ be an equivalence relation on $A$.
  The map $pi : A -> A slash.double R$ defined by
  $ pi(a) = [a] $
  is called the _quotient map_.

  It is always surjective.
]

=== Transpositions

#definition(title: [Transposition])[
  A transposition of the elements $i, j in {1, ..., n}$
  is the permutation $tau_(i j)$ with the cyclic notation $(i j)$.
]

#theorem[
  A permutation $sigma in S_n$ can be written as
  a composition of transpositions.
]

#definition(title: [Sign of a Permutation])[
  Let $k$ be the
  number of transpositions in
  any decomposition of a permutation $sigma in S_n$.
  The _sign_ of $sigma$ is $(-1)^k$.
  Hence,
  - if $k$ is _even_ then $sgn(sigma) = +1$
    and $sigma$ is said to be even.
  - if $k$ is _odd_ then $sgn(sigma) = -1$
    and $sigma$ is said to be odd.
]

#definition(title: [Fixed Point])[
  A fixed point is invariant under
  a transformation such as a permutation.
]

= Groups

=== Definition

#definition(title: [Group])[
  A _group_ is a set $G$ with
  a binary operation $* : G times G -> G$
  such that for all $a, b, c in G$, it satisfies
  1. (Closure) $a * b in G$
  2. (Associativity) $(a * b) * c = a * (b * c)$
  3. (Identity) $exists e in G : e * a = a * e = a$
  4. (Inverse) $exists a^(-1) in G : a * a^(-1) = a^(-1) * a = e$

  Additionally, a group is said to be _abelian_ or _commutative_ if
  5. (Commutative) $a * b = b * a$
]

#tip[
  The proof of (iii) and (iv) can be shortened if (v) is proven.
]

#note[
  Defying conventional wisdom,
  _abelian_ is usually not capitalized.
]

#definition(title: [Subgroup])[
  Let $(G, *)$ be a group.
  A subset $H subset.eq G$ is a _subgroup_ if it is itself a group
  under the operation inherited from $G$.

  A common test is: $H$ is non-empty and
  for all $a, b in H$, the element $a * b^(-1)$ also lies in $H$.
]

== Permutation Groups

=== Symmetric Groups

#definition(title: [Symmetric Group])[
  The _symmetric group_ of a set $X$ with $n$ elements is
  $ S_n = {sigma : X -> X | sigma "is bijective"} $
  and has $n!$ elements.
]

#definition(title: [Symmetric Group, Permutations])[
  The _symmetric group_ $S_n$ is
  the group of all permutations on $n$ elements
  under the operation of composition.
]

=== Alternating Groups

#definition(title: [Alternating Group])[
  The _alternating group_
  $ A_n = {sigma in S_n | "sgn"(sigma) = 1} $
  is the subgroup of $S_n$ consisting of all even permutations.

  It has $n!/2$ elements for $n >= 2$.
]

#theorem[
  The sign map $"sgn" : S_n -> {1, -1}$ is a group homomorphism.

  The kernel of this homomorphism is the alternating group
  $ ker("sgn") = A_n. $
]

= Fields

#definition(title: [Field])[
  A _field_ is a set $F$
  with two binary operations $+$ and $dot$ such that
  + $(F, +)$ is an abelian group with identity $0$.
  + $(F\\{0}, dot)$ is an abelian group with identity $1$.
  + Multiplication distributes over addition:\
    for all $a, b, c in F$, $a dot (b + c) = a dot b + a dot c$.

  #examples[$QQ, RR, CC, RR(x), QQ(i), FF_p$
    if $p$ is prime.
  ]
]

#definition(title: [Vector Space])[
  A vector space over a field $F$ is a set $V$ with two operations:
  - Vector addition $+ : V times V -> V$
  - Scalar multiplication $dot : F times V -> V$

  These must satisfy
  + (Closure under addition) $ve(u) + ve(v) in V$
  + (Distributivity over vectors) $a (ve(u) + ve(v)) = a ve(u) + a ve(v)$
  + (Associativity) $ve(u) + (ve(v) + ve(w)) = (ve(u) + ve(v)) + ve(w)$
  + (Identity) $ve(u) + ve(0) = ve(u)$
    \ \
  + (Inverse) $ve(u) + (-ve(u)) = ve(0)$
  + (Commutativity) $ve(u) + ve(v) = ve(v) + ve(u)$
    \ \
  + (Closure under scalar multiplication) $a ve(u) in V$
  + (Distributivity over scalars) $(a + b) ve(u) = a ve(u) + b ve(u)$
  + (Associativity) $a (b ve(u)) = (a b) ve(u)$
  + (Identity) $1 ve(u) = ve(u)$

  Note that requiring closure is often omitted.
]
