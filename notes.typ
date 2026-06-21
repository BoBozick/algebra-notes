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

=== Set theory

#definition[Tuple][
  A tuple (or sometimes *list*) is
  a finite, ordered collection of elements,
  possibly with repetitions.

  An $n$-tuple is of length $n$.
  A $2$-tuple is called an *ordered pair*.
]

=== Morphisms

#definition[Map][
  Subsets of the Cartesian product $A times B$ are called *relations*.
  A *map* is a *well-defined* relation written
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
    which is equivalent to being *right invertible*
    with $f compose f^(-1) = id_B$.
  - *injective* or *one-to-one*
    if $a_1 != a_2 ==> f(a_1) != f(a_2)$,
    which is equivalent to being *left invertible*
    with $f^(-1) compose f = id_A$.
  - *bijective* or a *one-to-one correspondence*
    if both above apply,
    which is equivalent to being *invertible*.
]

#definition[Homomorphism][
  A *homomorphism* is a map between algebraic structures
  that preserves the structure.

  A group homomorphism $phi : G -> H$ satisfies
  $ phi(g * gamma) = phi(g) dot phi(gamma) $
  for all $g, gamma in G$.
]

#theorem[
  If $phi : G -> H$ is a group homomorphism,
  + $phi(id_G) = id_H$
  + $phi(g^(-1)) = phi(g)^(-1)$ for all $g in G$
]


#definition[Isomorphism][
  An *isomorphism* is a bijective homomorphism.

  If there exists an isomorphism between two algebraic structures,
  they are said to be *isomorphic*, denoted with $tilde.equiv$.
]

#definition[Endomorphism][
  An *endomorphism* is a homomorphism from a mathematical object to itself.
]

#definition[Automorphism][
  An *automorphism* is simultaneously an isomorphism and an endomorphism:
  a bijective homomorphism from an object to itself.
]

#example[
  The *identity map* $id_X$ is a trivial automorphism defined
  $ id_X (x) = x wide forall x in X. $
]

#example[
  An automorphism of a set is called a *permutation*.
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
  $ A slash.double R $ and is called the *quotient set*.

  The equivalence classes form a partition of $A$.
]

#example[
  The modulo $m$ congruence class $[a] = {a + k m | k in ZZ}.$
]

#definition[Quotient Map][
  Let $R$ be an equivalence relation on $A$.
  The map $pi : A -> A slash.double R$ defined by
  $ pi(a) = [a] $
  is called the *quotient map*.

  It is always surjective.
]

=== Linear Diophantine Equations

Let $a$ and $b$ be integers with $gcd(a, b) = d$.

#lemma[Bézout's Identity][
  There exist integers $x$ and $y$ such that $a x + b y = d$.
]

#lemma[Euclid's][
  If $p$ is prime and $p divides a b$, then $p divides a$ or $p divides b$.
]

#theorem[Solvability Condition][
  The linear Diophantine equation $a x + b y = c$ has (infinitely many)
  solutions if and only if $d divides c.$
]

#theorem[Solutions][
  The solutions, if they exist, are
  $ x = x_0 + t b / d, quad y = y_0 - t a / d, quad "for" t in ZZ. $
]

#theorem[Euclidean Algorithm][
  Let $a$ and $b$ be non-negative integers with $a >= b$.
  Then there exist unique integers $q$ and $r$ such that
  $ a = q b + r, quad 0 <= r < b. $
]

#example[
  We apply the algorithm to compute $gcd(252, 105)$:
  $
    252 & = 2 dot 105 + 42 \
    105 & = 2 dot 42 + 21 \
     42 & = 2 dot 21 + 0 \
  $
  Hence, $gcd(252, 105) = 21$.
]

#example[
  We then use our results to solve $252 x + 105 y = 21$.

  Since $gcd(252, 105) = 21$, we now work backwards:
  $
    21 & = 105 - 2 dot 42 \
       & = 105 - 2 dot (252 - 2 dot 105) \
       & = 105 - 2 dot 252 + 4 dot 105 \
       & = 5 dot 105 - 2 dot 252 \
       & = -2 dot 252 + 5 dot 105
  $
  So a particular solution is $x_0 = -2, y_0 = 5$.
  The general solutions are
  $ x = -2 + 5t, quad y = 5 - 12t, quad "for" t in ZZ. $
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

  Additionally, a group is called *abelian* or *commutative* if it is
  5. (Commutative) $a * b = b * a$
]

#examples[
  The *general linear group* $G L_n (RR)$
  consists of all matrices in $RR^(n times n)$ with $det != 0$.
  The *special linear group* $S L_n (RR)$
  additionally requires that $det = 1$.
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

#theorem[Subgroup Criterion][
  A subset $H subset.eq G$ is a subgroup if and only if
  + $H != emptyset$
  + $a * b^(-1) in H quad forall a, b in H$
  or
  + $H != emptyset$ (nonempty)
  + $|H| < oo$ (finite)
  + $a * b in H quad forall a, b in H$ (closed)
]

#definition[Cyclic Subgroup][
  For any $a in G$, the set
  $ chevrons(a) = {a^k | k in ZZ} $
  forms a *cyclic subgroup* of $G$.
]

#theorem[
  The cyclic subgroup $chevrons(a) <= G$ is
  the smallest subgroup containing $a.$ 
]

#definition[Generator][
  An element $a in G$ is a *generator* of $G$ if $chevrons(a) = G$.
]

#definition[Cyclic Group][
  We say $G$ is a *cyclic group* if it contains a *generator* of itself.
]

#theorem[
  All subgroups of a cyclic group are cyclic.
]

#theorem[
  Every cyclic group is abelian.
]

#proof[
  Let $g$ and $gamma$ be elements of a cyclic group $G = chevrons(a)$.
  Then there are integers $m$ and $n$ such that $g = a^m$ and $y = a^n$, so
  $ g gamma = a^m a^n = a^(m + n) = a^(n + m) = a^n a^m = gamma g. $
]

== Cosets

Let $H$ be a subgroup of a group $G$.

#definition[Coset][
  For any $g in G$, the *left coset* of $H$ in $G$ is
  $ g H = {g * h | h in H}. $

  Similarly, the *right coset* is
  $ H g = {h * g | h in H}. $
]

#theorem[
  The left and right cosets respectively partition $G$.
]

#theorem[
  There are equally many left and right cosets of $H$ in $G$.
]

#definition[Order][
  The *order of a group* $|G|$ is the number of elements in $G$.

  The *order of an element* $|g|$ is the smallest positive integer $n$
  such that $g^n = e$. If there is no such $n$, the order is infinite.
]

#definition[Index][
  The *index* of $H$ in $G$ is the number of left cosets, denoted
  $[G : H].$
]

#theorem[Lagrange's][
  Let $G$ be finite.
  Then the order of $H$ divides the order of $G$.
]

#corollary[
  If $G$ is of prime order, it
  + lacks proper nontrivial subgroups
  + is generated by any element $g != e$
  + is cyclic
]

#theorem[Lagrange's, Generalized][
  Regardless of whether G is finite or infinite,
  $ |G| = [G : H] |H|. $
]

#proof[
  $G$ has $|G|$ elements and is partitioned into
  $[G : H]$ distinct left cosets, each of which has $|H|$ elements.
]

#definition[Conjugation][
  The *conjugation* by $a in G$ is an *inner automorphism* of $G$
  defined $g mapsto g a g^(-1)$.
]

#definition[Normal Subgroup][
  #let dist = h(1em)
  
  The following are equivalent for a subgroup $H$ of $G$:
  + $H$ is a *normal subgroup* of $G$,
    denoted $H triangle.small.l G$.
    \ #dist
  + $g h g^(-1) in H$ for all $g in G$ and $h in H$.
  + $g H g^(-1) subset.eq H$ for all $g in G$.
  + $g H g^(-1) = H$ for all $g in G$.
    \ #dist
  + $g H = H g$ (equal left coset and right coset) for all $g in G$.
  + The sets of left and right cosets coincide.
]

#examples[
  Trivially, $G$ and ${e}$ are always normal subgroups.
]

#definition[Simple Group][
  A group is *simple* if it has no normal nontrivial proper subgroup.
]

#theorem[
  All subgroups of abelian groups are normal subgroups.
]

== Rings

=== Definition

#definition[Ring][
  A *ring* is a set $R$ with two binary operations $+$ and $dot$ such that
  + $(R, +)$ is an abelian group with identity $0$.
  + $(R, dot)$ is a monoid with identity $1$.
  + Multiplication distributes over addition:\
    for all $a, b, c in R$, $a dot (b + c) = a dot b + a dot c$.
]

#definition[Group of Units][
  Let $(R, +, dot)$ be a ring.
  The *group of units* $U(R)$ is the set of all elements in $R$ that have
  multiplicative inverses, that is
  $ U(R) = {a in R | exists a^(-1) in R : a dot a^(-1) = a^(-1) dot a = 1}. $
]

=== $ZZ_n$

Let $a$ and $n$ be positive integers and let $p$ be prime.

#definition[$ZZ_n$][
  The *integers modulo $n$* is a set of congruence classes
  $ ZZ_n = {[0], [1], ..., [n - 1]} $
  that form an abelian group under $+$ and a monoid under $times$,
  together forming a ring with a group of units called
  the *multiplicative group of integers modulo $n$*, denoted $U(n)$
  and consisting of the integers coprime to $n$,
  with inverse elements defined to satisfy
  $a a^(-1) (equiv a^(-1) a) equiv 1 space (mod n).$
]

#definition[Euler's Totient Function][
  $
    phi.alt (n)
    = |U(n)|
    = |braces(k in ZZ, cond: 1 <= k <= n "and" gcd(n, k) = 1)|
  $
]

#example[
  $phi.alt (12) = |{1, 5, 7, 11}| = 4$
]

#theorem[Euler's][
  If $a$ and $n$ are coprime, then
  $ a^(phi.alt(n)) equiv 1 quad (mod n). $
]

#proof[
  The order of $a$ is $|U(n)| = phi.alt (n).$
]

#lemma[
  $phi.alt(p) = p - 1$
]

#theorem[Fermat's Little][
  If $a$ and $p$ are coprime, then
  $ a^(p - 1) equiv 1 quad (mod p). $

  In general, even if they are not coprime,
  $ a^p equiv a quad (mod p). $
]

== Permutations

=== Transpositions

#definition[Transposition][
  A *transposition* of the elements $i, j in {1, ..., n}$
  is the permutation $tau_(i j)$ with the cycle notation $(i space j)$.
]

#theorem[
  Any permutation can be written as compositions of transpositions.
]

#theorem[
  The identity permutation may only be written as
  an even number of transpositions.
]

#definition[Sign of a Permutation][
  Let $k$ be the number of transpositions in
  any decomposition of a permutation $sigma in S_n$.
  The *sign* of $sigma$ is $(-1)^k$.

  // Align.
  #context {
    let raw = ([*even*], [*odd*])

    let widths = raw.map(it => measure(it).width)
    let max-width = calc.max(..widths)

    let processed = raw.map(it => box(width: max-width, it))
    
    [
      Hence,
      - if $k$ is #processed.at(0) then $sgn(sigma) = +1$
        and $sigma$ is said to be even.
      - if $k$ is #processed.at(1) then $sgn(sigma) = -1$
        and $sigma$ is said to be odd.
    ]
  }
]

#theorem[Permutation Inverse][
  Let $sigma in S_n$ be a permutation.
  + $sigma = cycle(a_1, a_2, dots.h.c, a_m) = tau_1 tau_2 dots.h.c tau_k$
    for some $m <= n$ and $k$
  + $sigma^(-1)$ exists
    #proof[
      $sigma$ is a bijection.
    ]
  + $sigma^(-1) = cycle(a_m, dots.h.c, a_2, a_1) = tau_1 tau_2 dots.h.c tau_k$
    #proof[
      Consider that
      $(tau_i tau_j)^(-1) = tau_j^(-1) tau_i^(-1) = tau_j tau_i$
      and
      $cycle(a, b, c)^(-1) = (a -> b -> c -> a)^(-1) = (a <- b <- c <- a)$.
    ]
  + $sgn(sigma^(-1)) = sgn(sigma) = (-1)^k$
  
]

#definition[Fixed Point)][
  A *fixed point* is invariant under
  a transformation such as a permutation.
]

=== Symmetric Groups

#definition[Symmetric Group][
  The *symmetric group* of the finite set $X = {1, 2, ..., n}$ is
  $ S_n = {sigma : X -> X | sigma "is bijective"} $
  and consists of $n!$ permutations,
  which form *the symmetric group on $n$ letters*
  under the operation of composition
]

#theorem[
  The automorphism group of a set is its symmetric group.
]

#definition[Permutation Group][
  A subgroup of a symmetric group $S_n$ is a *permutation group*.
]

#definition[Alternating Group][
  The *alternating group*
  $ A_n = {sigma in S_n | "sgn"(sigma) = 1} $
  is the subgroup of $S_n$ consisting of all even permutations.

  It has $n!/2$ elements for $n >= 2$.
]

#theorem[
  The sign map $"sgn" : S_n -> {1, -1}$ is a group homomorphism.

  The kernel of this homomorphism is the alternating group
  $ ker("sgn") = A_n. $
]

== Symmetry

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

#theorem[
  The dihedral group can be represented as
  $ D_n = chevrons(r, s mid(|) r^n = s^2 = 1, r s = s r^(-1)). $
]

= Fields

#definition[Field][
  A *field* is a set $F$
  with two binary operations $+$ and $dot$ such that
  + $(F, +)$ is an abelian group with identity $0$.
  + $(F\\{0}, dot)$ is an abelian group with identity $1$.
  + Multiplication distributes over addition:\
    for all $a, b, c in F$, $a dot (b + c) = a dot b + a dot c$.
]


#examples[
  $QQ, RR, CC, RR(x), QQ(i),$ and $FF_p$ for prime $p$.
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
