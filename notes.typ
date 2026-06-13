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

#definition[
  The *integers modulo $m$* is a set of equivalence classes
  $ ZZ_m = {[0], [1], ..., [m - 1]} $
]

=== Cosets

#definition[Coset][
  Let $H subset.eq G$ be a subgroup of a group $G$.
  For any $g in G$, the *left coset* of $H$ in $G$ is
  $ g H = {g * h | h in H}. $

  Similarly, the *right coset* is
  $ H g = {h * g | h in H}. $
]

#theorem[Lagrange's][
  Let $G$ be a finite group and $H subset.eq G$ a subgroup.
  Then the order of $H$ divides the order of $G$.
]

#corollary[
  If $G$ is of prime order, it has no nontrivial subgroups.
]

#theorem[Lagrange's, Generalized][
  Regardless of whether G is finite or infinite,
  $ car(G) = car(G : H) car(H). $
]

=== Symmetry

#definition[Isometry][
  Let $(X, d_X)$ and $(Y, d_Y)$ be metric spaces.
  A map $f : X -> Y$ is an *isometry* if
  it perserves distances, that is,
  $ d_X (x_1, x_2) = d_Y (f(x_1), f(x_2)) quad forall x_1, x_2 in X. $
]

#definition[Symmetry][
  A *symmetry* of an object $O subset.eq X$ in a metric space $(X, d)$ is
  an isometry $f : X -> X$ with the image $f(O) = O$.

  Informally, a symmetry of a geometric object is
  a rearrangment of the object preserving
  the arrangement of its sides and vertices
  as well as its distances and angles.
]

#examples[
  Some types of symmetries:

  + / Reflectional:
      Reflection across a hyperplane
      (a line in $RR^2$ or a plane in $RR^3$)
  + / Rotational:
      Rotation within a plane
      ($RR^2$ is rotated around a fixed point, while
      $RR^3$ is rotated around an axis).
  + / Translational:
      All points are shifted by a constant vector.
  + / Identity:
      No change.
]

// Im unsure of the following
#definition[Rigid Motion][
  A *rigid motion* is a map $f : RR^n -> RR^n$ such that
  $ norm(u - v) = norm(f(u) - f(v)) quad forall u, v in RR^n. $

  Equivalently, it is a surjective isometry between Euclidean spaces
]

#example[
  A symmetry of an object in an Euclidean space $X = RR^n$
  is also a rigid motion.
]

#definition[Dihedral Group][
  The *dihedral group* $D_n$ is
  the group of symmetries (or equivalently rigid motions) of an $n$-gon.
  Its degree is $n$ and its order is $2n$.
]

= Sets

=== Set theory

#definition[Tuple][
  A tuple (or sometimes _list_) is
  a finite, ordered collection of elements,
  possibly with repetitions.

  An $n$-tuple is of length $n$.
  A $2$-tuple is called an _ordered pair_.
]

=== Morphisms

#definition[Map][
  Subsets of the Cartesian product $A times B$ are called _relations_.
  A *map* is a *well-defined*  relation written
  $
    f subset.eq A times B
    quad "or" quad
    f : A -> B
    quad "or" quad
    A ->^f B
  $
  and is
  - *surjective* or *onto* 
    if $f(A) = B$,
    which is equivalent to being _right invertible_
    with $f compose f^(-1) = id_B$.
  - *injective* or *one-to-one* 
    if $a_1 != a_2 ==> f(a_1) != f(a_2)$,
    which is equivalent to being _left invertible_
    with $f^(-1) compose f = id_A$.
  - *bijective* or a *one-to-one correspondence* 
    if both above apply,
    which is equivalent to being _invertible_.
]

#definition[Endomorphism][
  Let $X$ be some mathematical object.
  A map $phi : X -> X$ is an _endomorphism_.
  Should $phi$ simultaneously be bijective
  it is moreover an *automorphism* and,
  if $X$ is a set, a _permutation_.
  The most trivial automorphism is the *the identity map* $id_X$ with
  $ id_X (x) = x wide forall x in X. $
]

#definition[Homomorphism][
  A *homomorphism* is a map between algebraic structures
  that preserves the structure.

  For example, a group homomorphism $f : G -> H$ satisfies
  $ f(a * b) = f(a) * f(b) $
  for all $a, b in G$.
]

#definition[Isomorphism][
  An *isomorphism* is a bijective homomorphism.

  If there exists an isomorphism between two algebraic structures,
  they are said to be _isomorphic_.
]
  
=== Equivalance

#definition[Equivalance Relation][
  An *equivalance relation* on a set $A$
  is a relation $R subset.eq A times A$
  with the following properties:
  + / reflexive: $(a, a) in R wide forall a in A$
  + / symmetric: $(a, b) in R ==> (b, a) in R$
  + / transitive: $(a, b), (b, c) in R ==> (a, c) in R$

  If $(x, y) in R$ we write $x tilde y$.
]

#definition[Partition][
  A *partition* $cal(P)$ of a set $A$
  is a collection of non-empty, disjoint subsets of $A$
  whose union is $A$.
]

#definition[Equivalence Class][
  Let $R$ be an equivalence relation on a set $A$.
  The *equivalence class* of $a in A$ is
  $ [a] = {b in A | b tilde a}. $

  The set of all equivalence classes is written
  $ A slash.double R $ and is called the _quotient set_.

  The equivalence classes form a partition of $A$.
]

#definition[Quotient Map][
  Let $R$ be an equivalence relation on $A$.
  The map $pi : A -> A slash.double R$ defined by
  $ pi(a) = [a] $
  is called the _quotient map_.

  It is always surjective.
]

= Groups

=== Definition

#definition[Group][
  A *group* $(G, *)$ is a nonempty set $G$ with a binary operation
  $ * : G times G -> G $
  such that for all $a, b, c in G$, it satisfies
  1. (Closure) $a * b in G$
  2. (Associativity) $(a * b) * c = a * (b * c)$
  3. (Identity) $exists e in G : e * a = a * e = a$
  4. (Inverse) $exists a^(-1) in G : a * a^(-1) = a^(-1) * a = e$

  Additionally, a group is said to be *abelian* or *commutative*  if it is
  5. (Commutative) $a * b = b * a$
]

#tip[
  The proof of (iii) and (iv) can be shortened if (v) is proven.
]

#note[
  Defying conventional wisdom,
  *abelian* is usually not capitalized.
]

=== Subgroups

Let $(G, *)$ be a group.

#definition[Subgroup][
  A subset $H subset.eq G$ is a *subgroup* if it is itself a group
  under the operation inherited from $G$.
]

#tip[
  It follows that $H$ is a subgroup if
  + $H != emptyset$
  + $a * b^(-1) in H quad forall a, b in H$
]

#definition[Cyclical Subgroup][
  For all $a in G$, the set
  $ chevrons(a) = {a^k | k in ZZ} $
  with the operation $*$ is a *cyclical subgroup* of $(G, *)$.
]

#definition[Cyclical Group][
  We say $(G, *)$ is a *cyclical group* if $exists a in G : chevrons(a) = G$.
]

== Permutations

=== Transpositions

#definition[Transposition][
  A transposition of the elements $i, j in {1, ..., n}$
  is the permutation $tau_(i j)$ with the cyclic notation $(i j)$.
]

#theorem[
  A permutation $sigma in S_n$ can be written as
  a composition of transpositions.
]

#theorem[
  The identity $id in S_n$ may only be written as
  an even number of transpositions.
]

#definition[Sign of a Permutation][
  Let $k$ be the
  number of transpositions in
  any decomposition of a permutation $sigma in S_n$.
  The *sign* of $sigma$ is $(-1)^k$.
  Hence,
  - if $k$ is *even* then $sgn(sigma) = +1$
    and $sigma$ is said to be even.
  - if $k$ is *odd* then $sgn(sigma) = -1$
    and $sigma$ is said to be odd.
]

#definition[Fixed Point][
  A fixed point is invariant under
  a transformation such as a permutation.
]

=== Symmetric Groups

#definition[Symmetric Group][
  The *symmetric group* of the finite set $X = {1, 2, ..., n}$ is
  $ S_n = {sigma : X -> X | sigma "is bijective"} $
  and consists of $n!$ permutations,
  which form a group under the operation of composition
  called _the symmetric group on n letters_.
]

#definition[Permutation Group][
  A subgroup of a symmetric group $S_n$ is a _permutation group_.
]

#definition[Alternating Group][
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

#definition[Field][
  A *field* is a set $F$
  with two binary operations $+$ and $dot$ such that
  + $(F, +)$ is an abelian group with identity $0$.
  + $(F\\{0}, dot)$ is an abelian group with identity $1$.
  + Multiplication distributes over addition:\
    for all $a, b, c in F$, $a dot (b + c) = a dot b + a dot c$.

  #examples[
    $QQ, RR, CC, RR(x), QQ(i), FF_p$
    if $p$ is prime.
  ]
]

#definition[Vector Space][
  A vector space over a field $F$ is a set $V$ with two operations:
  - Vector addition $+ : V times V -> V$
  - Scalar multiplication $dot : F times V -> V$

  These must satisfy
  + (Closure under addition)
    $ve(u) + ve(v) in V$
  + (Distributivity over vectors)
    $a (ve(u) + ve(v)) = a ve(u) + a ve(v)$
  + (Associativity)
    $ve(u) + (ve(v) + ve(w)) = (ve(u) + ve(v)) + ve(w)$
  + (Identity)
    $ve(u) + ve(0) = ve(u)$
    \ \
  + (Inverse)
    $ve(u) + (-ve(u)) = ve(0)$
  + (Commutativity)
    $ve(u) + ve(v) = ve(v) + ve(u)$
    \ \
  + (Closure under scalar multiplication)
    $a ve(u) in V$
  + (Distributivity over scalars)
    $(a + b) ve(u) = a ve(u) + b ve(u)$
  + (Associativity)
    $a (b ve(u)) = (a b) ve(u)$
  + (Identity)
    $1 ve(u) = ve(u)$

  Note that requiring closure is often omitted.
]
