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

=== Excercises

#image("assets/image.png")

#image("assets/image-3.png")

#image("assets/image-4.png")

#image("assets/image-5.png")

#image("assets/image-6.png")

find an infinite subset that is closed under operation but not inverse

= Sets

== Relations

=== Set Theory

#definition[Tuple][
  A *tuple* (or sometimes *list*) is
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
  + $phi(G) <= H$
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

=== Equivalence

#definition[Equivalence relation][
  An *equivalence relation* on a set $A$
  is a relation $R subset.eq A times A$
  with the following properties:
  + / reflexive: $(a, a) in R wide forall a in A$
  + / symmetric: $(a, b) in R ==> (b, a) in R$
  + / transitive: $(a, b), (b, c) in R ==> (a, c) in R$

  If $(x, y) in R$ we write $x R y$ or $x tilde y$.
]

Let $R$ be an equivalence relation on a set $A$.

#definition[Equivalence class][
  The *equivalence class* of an element $a in A$
  $ [a] = dash(a) = {b in A mid(|) b tilde a} $
  is the set of all elements related to it.
]

#example[
  The modulo $m$ congruence class $[a] = {a + k m mid(|) k in ZZ}.$
]

#definition[Quotient set][
  The *quotient set* of $A$ by $R$
  $ A slash R = {[a] mid(|) a in A} $
  is the set of all equivalence classes induced by the relation.
]

#definition[Partition][
  A *partition* $cal(P)$ of a set $A$
  is a collection of non-empty, disjoint subsets of $A$
  whose union is $A$.
]

#theorem[
  The quotient set $A slash R$ forms a partition of $A$.
]

#definition[Quotient map][
  A *quotient map* is a map $pi : A -> A slash R$ defined by
  $ pi(a) = [a]. $
]

#theorem[][
  Quotient maps are surjective.
]

== $ZZ$

=== Linear Diophantine Equations

Let $a$ and $b$ be integers with $gcd(a, b) = d$.

#lemma[Bézout's identity][
  There exist integers $x$ and $y$ such that $a x + b y = d$.
]

#lemma[Euclid's][
  If $p$ is prime and $p divides a b$, then $p divides a$ or $p divides b$.
]

#theorem[Solvability condition][
  The linear Diophantine equation $a x + b y = c$ has (infinitely many)
  solutions if and only if $d divides c.$
]

#theorem[Solutions][
  The solutions, if they exist, are
  $ x = x_0 + t b / d, quad y = y_0 - t a / d, quad "for" t in ZZ. $
]

#theorem[Euclidean algorithm][
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

== Definitions

=== Groups

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

#theorem[Subgroup criterion][
  A subset $H subset.eq G$ is a subgroup if and only if
  + $H != emptyset$
    (nonempty)
  and
  #set enum(start: 2)
  + $a * b^(-1) in H quad forall a, b in H$
    (closed under operation with inverse)
  or
  + $a * b in H quad forall a, b in H$
    (closed under operation)
  + $a^(-1) in H quad forall a in H$
    (closed under inverse)
  or
  + $a * b in H quad forall a, b in H$
    (closed under operation)
  + $|H| < oo$
    (finite)
]

#definition[Maximal subgroup][
  A *maximal subgroup* $H$ of a group $G$ is a proper subgroup
  such that no proper subgroup $K$ contains $H$ strictly.
]

=== Cyclic

#definition[Cyclic subgroup][
  For every $a in G$, the set
  $ ⟨a⟩ = {a^k mid(|) k in ZZ} $
  forms a *cyclic subgroup* of $G$.
]

#theorem[
  The cyclic subgroup $⟨a⟩ <= G$ is
  the smallest subgroup containing $a.$
]

#definition[Generating set][
  The subgroup
  $⟨S⟩ = ⟨s, s^(-1) mid(|) s in S⟩ = {s^k mid(|) s in S, k in NN}$
  consists of all _finite_ products of elements
  in its *generating set* $S$ and their inverses.
]

#definition[Generator][
  An element $a in G$ is a *generator* of $G$ if $⟨a⟩ = G$.
]

#definition[Cyclic group][
  We say $G$ is a *cyclic group* if it contains a *generator* of itself.
]

#theorem[
  All subgroups of a cyclic group are cyclic.
]

#theorem[
  Every cyclic group is abelian.
]

#proof[
  Let $g$ and $gamma$ be elements of a cyclic group $G = ⟨a⟩$.
  Then there are integers $m$ and $n$ such that $g = a^m$ and $y = a^n$, so
  $ g gamma = a^m a^n = a^(m + n) = a^(n + m) = a^n a^m = gamma g. $
]

== $ZZ slash n ZZ$

#theorem[
  If $a c equiv b c space (mod n)$
  then $a equiv b space (mod n / gcd(c, n))$.
]

Let $a$ and $n$ be positive integers and let $p$ be prime.

#definition[$ZZ slash n ZZ$][
  The *integers modulo $n$* is a set of congruence classes
  $
    ZZ slash n ZZ = ZZ slash (n)
    = ZZ_n = {[0], [1], ..., [n - 1]}
  $
  that form an abelian group under $+$ and a monoid under $times$,
  together forming a ring with a group of units called
  the *multiplicative group of integers modulo $n$*
  $
    U(n) = U(ZZ slash n ZZ) = (ZZ slash n ZZ)^times
    = {[a] in ZZ slash n ZZ mid(|) gcd(a, n) = 1}
  $
  with multiplicative inverses such that
  $a a^(-1) (equiv a^(-1) a) equiv 1 space (mod n).$
]

#definition[Euler's totient function][
  $ phi.alt (n) = |U(n)| $
]

#example[
  $phi.alt (12) = |{[1], [5], [7], [11]}| = 4$
]

#theorem[Euler's][
  If $a$ and $n$ are coprime, then
  $ a^(phi.alt(n)) equiv 1 quad (mod n). $
]

#proof[
  By Lagrange's Theorem, the order $|[a]|$ of any element divides the order $|(ZZ slash n ZZ)^times| = phi.alt(n)$ of its group, so $[a]^phi.alt(n) = [1]$.
]

#lemma[
  $phi.alt(p) = p - 1$
]

#theorem[Fermat's little][
  If $a$ and $p$ are coprime, then
  $ a^(p - 1) equiv 1 quad (mod p). $

  In general, even if they are not coprime,
  $ a^p equiv a quad (mod p). $
]

#theorem[Chinese remainder][
  Let $m_1, m_2, ..., m_n$ be pairwise coprime integers greater than $1$
  and let $a_1, a_2, ..., a_n$ be integers.
  Then the system

  #context {
    let width-diff = measure($tilde.equiv$).width - measure($dots.v$).width
    $
      x &tilde.equiv a_1 space (mod m_1) \
      x &tilde.equiv a_2 space (mod m_2) \
      &#h(width-diff / 2) dots.v \
      x &tilde.equiv a_n space (mod m_n) \
    $
  }
  has a unique solution modulo $m = m_1 m_2 dots.h.c m_n$ given by
  $ x = a_1 M_1 y_1 + a_2 M_2 y_2 + ... + a_n M_n y_n, $
  where $M_i = m / m_i$ and $y_i = M_i^(-1) space (mod m_i)$.
]

== Families

=== Commutation

Let $X$ be a nonempty subset of $G$.

#definition[Centralizer][
  The *centralizer* of $X$ in $G$ is the set
  $ C_G (X) = {g in G mid(|) g x g^(-1) = x "for all" x in X}, $
  all elements in $G$ that commute with all elements in $X$,
  fixing every element of $X$ under conjugation.
]

#remark[
  $g x g^(-1) = x <==> g x = x g$
]

#note[
  If $X$ is a singleton set ${x}$, we simply write $C_G (x)$.
]

#definition[Center][
  The *center* of $G$ is the set
  $
    Z(G) = C_G (G) =
    {g in G mid(|) g gamma g^(-1) = gamma "for all" gamma in G},
  $
  all elements in $G$ that commute with all elements in $G$,
  fixing every element of $G$ under conjugation.
]

#definition[Normalizer][
  The *normalizer* of $X$ in $G$ is the set
  $ N_G (X) = {g in G mid(|) g X g^(-1) = X}, $
  all elements in $G$ that commute with $X$ as a set,
  fixing $X$ as a set under conjugation.
]

#theorem[
  $Z(G) <= C_G (X) <= N_G (X) <= G,$
  with all equalities if $G$ is abelian.
]

#theorem[
  If $X$ is a subgroup, not just a subset, then $X <= N_G (X) <= G.$
]

#definition[Commutator][
  Let $G$ be a group with elements $x, y in G$
  and nonempty subsets $A, B subset.eq G$.
  + The *commutator* of $x$ and $y$ is $[x, y] = x^(-1) y^(-1) x y.$
  + $[A, B] = chevron.l [a, b] mid(|) a in A, b in B chevron.r$
  + Define $G' = chevron.l [x, y] mid(|) x, y in G chevron.r$,
    the subgroup of $G$ generated by commutators of elements from $G$,
    called the *commutator subgroup* of $G$.
]

#theorem[
  $[x, y] = id_G <==> x "and" y "commute"$
]

=== Group Action

#definition[Group action][
  A map $dot : G times X -> X$ is a *(left) group action* if it satisfies:
  + (Identity)
    $e dot x = x$
    for all $x in X$.
  + (Compatibility)
    $g dot (h dot x) = (g h) dot x$
    for all $g, h in G$ and $x in X$.
]

Let $dot : G times X -> X$ be a group action.

#definition[Orbit][
  The *orbit* of $x in X$ is the set
  $ G dot x = {g dot x mid(|) g in G}, $
  all points in $X$ that $x$ can be moved to by the group action.
]

#theorem[
  The set $X$ is partitioned by the set of its orbits under a group action.
  The orbits are
  the equivalence classes under the induced equivalence relation
  $ x ~ y <==> exists g in G : g dot x = y <==> G dot x = G dot y. $
]

#definition[Transitive action][
  The action of $G$ on $X$ is *transitive* if there is only one orbit, i.e.,
  given any pair $x, y in X$ there is some $g in G$ such that $g dot x = y$.
]

#theorem[
  The orbits of a cyclic subgroup $⟨sigma⟩ <= S_n$ is
  the sets of numbers in the distinct cycles
  given by its cycle decomposition.
]

#example[
  The orbits of $⟨cycle(1, 2) cycle(3, 4, 5)⟩$ are ${1, 2}$ and ${3, 4, 5}$.
]

#definition[Stabilizer][
  The *stabilizer* of $x in G$ is the set
  $ G_x = {g in G mid(|) g dot x = x}, $
  all elements in $G$ that fix $x$ under the group action.

  The *stabilizer* of $X subset.eq G$ is the set
  $ G_X = {g in G mid(|) g dot X = X}, $
  all elements in $G$ that fix $X$ under the group action.
]

#theorem[Orbit--Stabilizer][
  $|G dot x| = [G : G_x] = |G| / |G_x|$
]

#definition[Fixed point set][
  The *fixed point set* of $g in G$ is the set
  $ X^g = {x in X mid(|) g dot x = x}, $
  all elements in $X$ that are fixed under $g$.
]

#definition[Kernel][
  The *kernel* is the set
  $ ker(dot) = {g in G mid(|) g dot x = x "for all" x in X}, $
  all elements in $G$ that fix every element of $X$ under the group action.
]

#definition[Faithful][
  A group action is *faithful* if $ker(dot) = {e}$.
]

== Conjugation

=== Cosets

Let $H$ be a subgroup of a group $G$.

#definition[Coset][
  For any $g in G$, the *left coset* of $H$ in $G$ is
  $ g H = {g * h mid(|) h in H}. $

  Similarly, the *right coset* is
  $ H g = {h * g mid(|) h in H}. $

  An element of a coset is a *representative* for that coset.
]

#theorem[
  The left and right cosets respectively partition $G$.
]

#definition[Index][
  The *index* of $H$ in $G$ is the number of left cosets, denoted
  $[G : H].$
]

#theorem[
  There are equally many left and right cosets of $H$ in $G$.
]

=== Conjugation

#definition[Conjugation][
  The *conjugation* by $a in G$ is an *inner automorphism* of $G$
  defined $g mapsto g a g^(-1)$.
]

#definition[Conjugate][
  Two subsets $X$ and $Y$ of $G$ are said to be *conjugate*
  if there is some $g in G$ such that $X = g Y g^(-1)$,
  i.e., if and only if they are in the same orbit of
  $G$ acting on its subsets by conjugation.
]

#lemma[
  Let $G$ be a group acting on a nonempty set $A$.
  + The relation
    $ a ~ b space "if and only if" space a = g dot b "for some" g in G $
    is an equivalence relation.
  + For each $a in A$, the number of elements in its
    equivalence class (the orbit of $G$ containing $a$)
    is $[G : G_a]$, the index of the stabilizer of $a$.
  + The stabilizer of any subset $S subset.eq G$ under conjugation
    is $G_S = N_G (S)$, the normalizer of $S$ in $G$.
]

#lemma[
  $N_G ({s}) = C_G ({s}) = C_G (s)$ by definition.
]

#theorem[
  The number of conjugates of a subset $S$ in a group $G$
  is $[G : N_G (S)]$, the index of the normalizer of $S$.

  In particular, the number of conjugates of an element $s$ of $G$
  is $[G : C_G (s)]$, the index of the centralizer of $s$.
]

#image("assets/image-11.png")

=== Normalness

#definition[Normal subgroup][
  #let dist = v(1em)

  The following are equivalent for a subgroup $H$ of $G$:
  + $H$ is a *normal subgroup* of $G$,
    denoted $H normal.eq G$.
    #dist
  + $g h g^(-1) in H$ for all $g in G$ and $h in H$.
  + $g H g^(-1) subset.eq H$ for all $g in G$.
  + $g H g^(-1) = H$ for all $g in G$.
    #dist
  + $g H = H g$ (equal left coset and right coset) for all $g in G$.
  + The sets of left and right cosets coincide.
]

#examples[
  Trivially, $G normal.eq G$ and ${e} normal.eq G$.
]

#warning[
  Normalness is not transitive, i.e.,
  $
    A normal.eq B normal.eq C
    space cancel(arrow.r.double.long, length: #50%, angle: #20deg) space
    A normal.eq C.
  $
]

#note[
  Some authors use $normal$ exclusively for proper normal subgroups,
  while others use it for all normal subgroups.

  The same principle holds for the subset sign $subset$.
]

#theorem[
  Every subgroup of index $2$ is normal.
] <thm-index2>

#proof[
  Let $H <= G$ be the subgroup such that $[G : H] = 2$.
  We wish to show that $g H = H g$ for all $g in G$.

  If $g in H$, then $g H = H = H g$.
  Otherwise, if $g in.not H$, then $g H = G slash H = H g$
  since $H union H g = G = H union g H$. // Not obvious!

  Thus, $g H = H g$ for all $g$, so $H$ is a normal subgroup of $G$.
]

#theorem[
  If $H <= G$ and $K <= G$,
  then $H K <= G$ if and only if $H K = K H$.
]

#corollary[
  If $g H = H gamma$ for some $g, gamma in G$,
  then $g = gamma$ and $g in N_G (H)$.
]

#theorem[
  All subgroups of abelian groups are normal subgroups.
]

#definition[Simple group][
  A group is *simple* if it has no normal nontrivial proper subgroup.
]

== Order

=== Definition

#definition[Order][
  The *order of a group* $|G|$ is the number of elements in $G$.

  The *order of an element* $|g|$ is the smallest positive integer $n$
  such that $g^n = e$. If there is no such $n$, the order is infinite.
]

#theorem[Classification][
  #context {
    let (Z, Zn) = match-widths($ZZ$, $ZZ_n$)
    let (eq, lt) = match-widths($=$, $<$)

    [
      If $G$ is a cyclic group of order $n$, then
      + $G tilde.equiv #Z <==> n #eq oo$
      + $G tilde.equiv #Zn <==> n #lt oo$
    ]
  }
]

=== Lagrange's Theorem

#theorem[Lagrange's][
  Let $G$ be finite.
  Then the order of $H$ divides the order of $G$.
]

#corollary[
  $g^(|G|) = e$ for all $g in G$.
]

#corollary[
  If $G$ is of prime order, it
  + lacks proper nontrivial subgroups
  + is generated by any element $g != e$
  + is cyclic
]

#theorem[Lagrange's, generalized][
  Regardless of whether $G$ is finite or infinite,
  $ |G| = [G : H] |H|. $
]

#proof[
  $G$ has $|G|$ elements and is partitioned into
  $[G : H]$ distinct left cosets, each of which has $|H|$ elements.
]

#corollary[
  If $H normal.eq G$ then $[G : H] = |G| / |H| = |G slash H|.$
]

=== Torsion

#definition[Bounded group][
  $exists N in ZZ^+ : g^N = e space forall g in G$
]

#definition[Torsion group][
  $forall g in G space exists n in ZZ^+ : g^n = e$
]

#examples[
  Finite groups. Bounded groups.
]

#definition[Torsion subgroup][
  If $G$ is abelian, its torsion subgroup is an abelian subgroup
  $
    T(G)
    = {g in G : exists n in ZZ^+ : g^n = e}
    = {g in G : |g| < oo}.
  $

  Two special cases arise:
  + If $T(G) = G$ then $G$ is a *torsion abelian group*.
  + If $T(G) = {e}$ then $G$ is a *torsion-free abelian group*.
]

=== Prime Divisors

Let $G$ be a finite group,
let $p$ be a prime, and
let $k$, $j$, and $m$ be positive integers,
where $m$ (if it exists) is chosen such that $p divides.not m$.

#theorem[
  If $p$ is the smallest prime that divides $|G|$,
  then any subgroup of index $p$ (the existence of which is not guaranteed)
  is normal.
]

#theorem[Cauchy's, or prime divisors][
  If $p$ is a prime that divides $|G|$,
  then $G$ must have a subgroup _and an element_ of order $p$.
]

#theorem[Sylow's, or prime power divisors][
  If $p^j$ is a _prime power_ and divides $|G|$,
  then $G$ must have a subgroup of order $p^j$.
]

#definition[$p$-group][
  + If $|G| = p^k$,
    then $G$ is a *$p$-group*.
  + If $G$ Sylowis a $p$-group and a subgroup,
    then $G$ is a *$p$-subgroup*.
  + If $|G| = p^k m$,
    then there are $n_p (G)$ maximal $p$-subgroups $"Syl"_p (G)$,
    each a *Sylow $p$-subgroup* of order $p^k$.
] <def-pgroup>

#definition[$p$-group, generalized][
  Let $G$ be possibly infinite.
  + If every element of $G$ 
  + A $p$-subgroup of $G$ is a *Sylow $p$-subgroup* if it is maximal,
    i.e., not a proper subgroup of any other $p$-subgroup in $G$
]

Let $P in "Syl"_p (G)$.

#lemma[
  If $Q$ is a $p$-subgroup of $G$,
  then $Q inter N_G (P) = Q inter P.$
]

#theorem[Sylow's][
  + $"Syl"_p (G) != emptyset$
  + If $P$ is a Sylow $p$-subgroup and $Q$ is a $p$-subgroup,
    then $ exists g in G : Q <= g P g^(-1), $
    i.e., $Q$ is contained in some conjugate of $P$.
    In particular, any two Sylow $p$-subgroups of $G$ are conjugate in $G$.
  + $n_p | [G : P]$, where $[G : P] = m$.
  + $n_p equiv 1 space (mod p)$.
  + $n_p = lr([G : N_G (P)])$ for every $P in "Syl"_p (G)$.
]

#corollary[Cauchy's theorem][
  If $p divides |G|$ then there is a $g in G$ such that $|g| = p$.
] <thm-cauchy>

@thm-cauchy[-] says $G$ has a cyclical subgroup of order $|⟨g⟩| = p$.

#corollary[
  Let $P <= G$ be a Sylow $p$-subgroup.
  The following are equivalent:
  + $P$ is the only Sylow $p$-subgroup of $G$, i.e., $n_p (G) = 1$.
  + $P$ is normal in $G$.
  + $P$ is characteristic in $G$.
  + All subgroups generated by elements of $p$-power order are $p$-groups,
    i.e., if $X$ is any subset of $G$ such that $|x|$ is a power of $p$
    for all $x in X$, then $chevrons(X)$ is a $p$-group.
]

#example[
  If $p divides.not |G|$,
  the only Sylow $p$-subgroup is the trivial group.
]

#example[
  If $|G| = p^k$,
  the only Sylow $p$-subgroup is $G$ itself.
]

#example[
  If $G$ is abelian, there is a unique Sylow $p$-subgroup for each $p$.
  This subgroup, the _$p$-primary component_ of $G$,
  consists of all elements $x$ whose order is a power of $p$.
]

#theorem[
  Sylow $p$-subgroups of the same group and order are isomorphic.
]

=== Finitely Generated Abelian Groups

#definition[Finitely generated][

]

#definition[Free abelian group][

]

#theorem[Fundamental of finitely generated abelian groups][
  Let $G$ be a finitely generated abelian group.
  +
]

#corollary[
  If $n$ is the product of distinct primes,
  then up to isomorphism the only abelian group of order $n$ is $C_n$.
]

#definition[Invariant factor decomposition][

]

#corollary[

]

#theorem[

]

#definition[Elementary divisor decomposition][

]


#theorem[
  Let $m, n in ZZ^+$.
  Then $ZZ_m times ZZ_n tilde.equiv ZZ_(m n) <==> gcd(m, n) = 1.$
]

#proof[
  We must prove both implications.

  Consider the element $g = (1, 1) in ZZ_m times ZZ_n$
  which has order $|g| = lcm(|1_m|, |1_n|) = lcm(m, n)$.

  First assume $gcd(m, n) = 1$.
  Then $|g| = m n$
]

#theorem[
  
]

#tip[

]

#definition[Rank][

]

#definition[Exponent][

]

== Homomorphisms

=== Fibers

#definition[Fiber][
  Let $phi : G -> Omega$ be a surjective map from a group to a set.
  The *fiber* of $phi$ over some $omega in Omega$ is its preimage in $G$
  $ phi^(-1) (y) = {g in G mid(|) phi.alt(g) = omega}, $
  the set of all elements in the domain that map to $omega$.
]

Let $phi : G -> H$ be a group homomorphism.

#definition[Fiber of group][
  The *fiber* of $phi$ over some $h in H$ is
  $ phi^(-1)(h) = {g in G mid(|) phi(g) = h}. $
]

#theorem[
  The collection of nonempty fibers forms a partition of $G$.
  Hence, every $g in G$ is only in the fiber over $phi(g)$.
]

#definition[Kernel][
  The *kernel* of a group homorphism $phi$ is the set
  $ ker phi = phi^(-1)(id_H) = {g in G mid(|) phi(g) = id_H }. $
]

Let $K = ker phi$.

#theorem[
  $K normal.eq G$
]

#theorem[
  For every $g in G$ such that $phi(g) = h$ the entire fiber is
  $ phi^(-1)(h) = g K = K g. $

  In words, the fibers of a homomorphism are the cosets of its kernel.
]

#definition[Quotient group, alternative][
  The quotient group is
  $ G slash K = {phi^(-1)(h) mid(|) h in phi(G)}, $
  the set of all nonempty fibers of $phi$.

  If $phi$ is surjective, then $phi(G) = H$ and all fibers are nonempty.
]

#definition[Quotient group][
  Let $N normal.eq G$.
  The *quotient group* or *factor group* is
  $ G slash N = {g N mid(|) g in G} (= {N g mid(|) g in G}), $
  the set of all left cosets of $N$ in $G$,
  paired with the group operation
  $ (a N) * (b N) = (a b) N quad forall a, b in G, $
  which is well-defined if and only if $N normal.eq G$.
]

#example[#align(center)[
  #let headings = ("name", "symbol", "set", "operation")

  #let names = ("large group", "normal subgroup", "quotient group")
  #let syms = ($G$, $N$, $G slash N$)
  #let sets = ($ZZ$, $n ZZ$, $ZZ_n$)
  #let ops = ($+$, $+$, $+ mod n$)

  #let contents = names.zip(syms, sets, ops)

  #table(
    columns: 4,
    stroke: none,
    align: (right, left, left, left),
    inset: (x: 6pt, y: 7pt),

    table.vline(x: 1, stroke: 0.5pt),
    table.hline(y: 1, stroke: 0.5pt),

    table.header(..headings),
    ..contents.flatten(),
  )
]]

=== Natural Projections

#definition[Natural projection][
  Let $N normal.eq G$.
  The natural/canonical projection/homomorphism
  is the map $pi : G -> G slash N$ defined by $pi(g) = g N$ for all $g in G$.
]

#theorem[
  For $pi$ defined above:
  + $pi$ is a homomorphism
  + $pi$ is surjective, i.e., $pi(G) = G slash N$
  + $ker pi = N$
]

#image("assets/image-9.png", height: 6em)

#definition[Commute][
  A diagram as above where all paths end at the same node
  is said to *commute*.
]

=== The Isomorphism Theorems

Let $phi : G -> H$ be a group homomorphism.

#theorem[First, or fundamental of homomorphisms][
  + $ker phi normal.eq G$
  + $phi(G) tilde.equiv G slash ker phi$
  + $phi(G) <= H$
]

#corollary[
  #let dist = v(0.5em)

  + $|phi(G)| = [G : ker phi]$
    #dist
    The following are equivalent:
  + $phi "is surjective"$
  + $H tilde.equiv G slash ker phi$
  + $|G| = [G : ker phi] quad$ #proof[See (i).]
    #dist
    The following are equivalent:
  + $phi "is injective"$
  + $ker phi = id_G$
]

#lemma[
  If $A$ and $B$ are subgroups of $G$, then
  $ A B <= G <==> A B = B A $
]

#lemma[
  If $A$ and $B$ are finite subgroups of $G$, then
  $ |A B| = (|A\||B|)/(|A inter B|). $
  Note that $A B$ is not necessarily a group.
]

#theorem[Second, or diamond, or parallelogram][
  Let $S <= G$ and $N <= G$ be subgroups such that $S <= N_G (N)$.
  + $S N <= G$ #h(1em) #proof[See the above lemma.]
  + $N normal.eq S N$
  + $S inter N normal.eq S$
  + $(S N) slash N tilde.equiv S slash (S inter N)$
]

#image("assets/image-1.png", width: (72 / 300) * 333pt)

#remark[
  If $N normal.eq G$ and thus $N_G (N) = G$,
  then $S <= N_G (N)$ is satisfied.
]

#theorem[Third][
  Let $H normal.eq G$ and $K normal.eq G$ be subgroups such that $H <= K$.
  + $K slash H normal.eq G slash H$
  + $(G slash H) slash (K slash H) tilde.equiv G slash K$
]

#theorem[Fourth, or lattice][
  #image("assets/image-7.png")

  #image("assets/image-8.png")
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

#theorem[Order][
  $|sigma| = "length"(sigma)$
]

#definition[Sign of a permutation][
  Let $k$ be the number of transpositions in
  any decomposition of a $(k + 1)$-cycle $sigma in S_n$,
  The *sign* of $sigma$ is $(-1)^k$.

  #context {
    let (even, odd) = match-widths([*even*], [*odd*])

    [
      Hence,
      + if $k$ is #even then $sgn(sigma) = +1$
        and $sigma$ is said to be even.
      + if $k$ is #odd then $sgn(sigma) = -1$
        and $sigma$ is said to be odd.
    ]
  }
]

#theorem[Permutation inverse][
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
  + $sigma^(-1) = sigma^k <==> "length"(sigma) = k$

    #proof[
      The order of a $k$-cycle is $k$.
    ]
  + $sgn(sigma^(-1)) = sgn(sigma) = (-1)^k$
]

#definition[Fixed point)][
  A *fixed point* is invariant under
  a transformation such as a permutation.
]

=== Symmetric Groups

#definition[Symmetric group][
  The *symmetric group* of the finite set $X = {1, 2, ..., n}$ is
  $ S_n = {sigma : X -> X mid(|) sigma "is bijective"} $
  and consists of $n!$ permutations,
  which form *the symmetric group on $n$ letters*
  under the operation of composition
]

#warning[
  Symmetric groups are not to be confused with _symmetry_ groups.
]

#theorem[
  The automorphism group of a set is its symmetric group.
]

#definition[Permutation group][
  A subgroup of a symmetric group $S_n$ is a *permutation group*.
]

#definition[Alternating group][
  The *alternating group*
  $ A_n = {sigma in S_n mid(|) "sgn"(sigma) = 1} $
  is the subgroup of all ($n!/2$ if $n>= 2$) even permutations in $S_n$.
]

#theorem[
  The number of $k$-cycles is
  $ binom(n, k) (k - 1)! = n!/((n-k)!k!) (k - 1)! = n!/((n-k)!k) $
  in $S_n$.
  In $A_n$ there are equally many if $k$ is odd,
  but $0$ if $k$ is even.
]

#problem[
  Show that $A_4$ has no subgroup of order $6$.
]

#solution[
  Assume the opposite;
  suppose there is a subgroup $H <= A_4$ such that $|H| = 6$.

  By Lagrange's theorem,
  $[A_4 : H] = |A_4| / |H| = 12 / 6 = 2.$
  @thm-index2 dictates that any subgroup of index $2$ is normal,
  so $H normal A_4$.
  Since the quotient group has order $|A_4 slash H| = [A_4 : H] = 2$,
  $ (g H)^2 = H space ==> space g^2 H = H space ==> space g^2 in H $
  for all $g in A_4$.

  There are 8 distinct 3-cycles in $A_4$.
  The inverse of any 3-cycle $g in A_4$ is
  $g^(-1) = g^2 in H$, since the length is 3.
  Hence, $g in H$.
  However, there are 8 distinct 3-cycles in $A_4$,
  so it follows that $|H| >= 8 > 6$.
]

#theorem[
  The sign map $"sgn" : S_n -> {1, -1}$ is a group homomorphism.

  The kernel of this homomorphism is the alternating group
  $ ker("sgn") = A_n. $
]

== Symmetry

=== In Metric Spaces

#definition[Isometry][
  Let $(X, d_X)$ and $(Y, d_Y)$ be metric spaces.
  A map $f : X -> Y$ is an *isometry* if
  it perserves distances, i.e.,
  $ d_X (x_1, x_2) = d_Y (f(x_1), f(x_2)) quad forall x_1, x_2 in X. $
]

#definition[Symmetry][
  A *symmetry* of an object $O subset.eq X$ in a metric space $(X, d)$ is
  an isometry $f : X -> X$ with the image $f(O) = O$.

  Informally, a symmetry of a geometric object is
  a rearrangment of the object preserving
  the arrangement of its sides and vertices
  as well as its distances and angles.
] <def-symmetry>

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
#definition[Rigid motion][
  A *rigid motion* is a map $f : RR^n -> RR^n$ such that
  $ norm(u - v) = norm(f(u) - f(v)) quad forall u, v in RR^n. $

  Equivalently, it is a surjective isometry between Euclidean spaces
]

#example[
  A symmetry of an object in an Euclidean space $X = RR^n$
  is also a rigid motion.
]

=== Dihedral Groups

#definition[Dihedral group][
  The *dihedral group* $D_n$ or $D_(2 n)$ is
  the group of symmetries (or equivalently rigid motions) of an $n$-gon.
  Its degree is $n$ and its order is $2n$.
]

#theorem[
  The dihedral group can be represented as
  $ D_n = ⟨r, s mid(|) r^n = s^2 = 1, r s = s r^(-1)⟩. $
]

== Products

=== Direct

#definition[External direct product][
  The *(external) direct product* $G_1 times G_2 times dots.h.c times G_n$
  of the sets $G_1, G_2, ..., G_n$ with the operations $*_1, *_2, ..., *_n$
  is the set of $n$-tuples with operation defined componentwise:
  $
    (g_1, ..., g_n) * (gamma_1, ..., gamma_n)
    = (g_1 *_1 gamma_1, ..., g_n *_n gamma_n).
  $

  If there are infinitely many groups,
  the $n$-tuples are replaced by sequences.
]

#theorem[
  $
    G slash G_i tilde.equiv
    G_1 times dots.h.c times G_(i-1) times G_(i+1) times dots.h.c times G_n
  $
]

#theorem[
  $ |G_1 times G_2 times dots.h.c times G_n| = |G_1| |G_2| dots.h.c |G_n| $
]

#theorem[
  Let $x_i = (id_1, ..., id_(i-1), g_i, id_(i+1), ..., n)$
  for some $g_i in G_i$. Then
  $
    |x_1 x_2 dots.h.c x_n| =
    lcm(|x_1|, |x_2|, ..., |x_n|).
  $
]

Let $H$ and $K$ be subgroups of a group.

#lemma[
  The number of distinct ways of writing
  each element of $H K$ of the form $h k$ is $|H inter K|$.
]

#proof[
  // TODO
]

Assume $H$ and $K$ are trivially disjoint and normal in the group, i.e.,
$ H, K normal.eq G space "and" space H inter K = {e}. $

#theorem[Recognition for direct products][
  $H K tilde.equiv H times K$
]

#corollary[
  If $|H||K| = |G|$ then $G tilde.equiv H times K$.
]

#definition[Internal direct product][
  The internal direct product of $H$ and $K$ is $H K$
  (or, equivalently under the assumptions, $K H$).
]

= Rings

== Definition

#definition[Ring][
  A *ring* is a set $R$ with two binary operations $+$ and $dot$ such that
  + $(R, +)$ is an abelian group with identity $0$.
  + $(R, dot)$ is a monoid with identity $1$.
  + Multiplication distributes over addition:\
    for all $a, b, c in R$, $a dot (b + c) = a dot b + a dot c$.
]

#note[
  Possibly $1 = 0$.
]

#remark[
  Historically, a ring was sometimes defined without
  the requirement of a multiplicative identity.

  Authors who follow either convention the following terms to refer to
  objects satisfying the other convention:
  - to include a requirement for a multiplicative identity: \
    "unital~ring", "unitary~ring", "unit~ring", "ring~with~unity",
    "ring~with~identity", "ring with a unit", or "ring~with~1".
  - to omit a requirement for a multiplicative identity: \
    "rng" or "pseudo#sym.hyph.nobreak;ring",
    although the latter may be confusing because it also has other meanings.
]

Let $(R, +, dot)$ be a ring.
Note that $R$ by definition must be nonempty.

#definition[Subring][
  A subset $S subset.eq R$ is a *subring* of $R$ if it is a ring.
]

#theorem[Subring criterion][
  A subset $S subset.eq R$ is a subring if and only if
  it is closed under subtraction and multiplication.
]

#definition[Zero divisor][
  A nonzero element $a in R$ for which there is some nonzero element $b in R$
  such that $a b = 0$ or $b a = 0$ is a *zero divisor*.
]

#definition[Unit][
  A element $a in R$ with a multiplicative inverse $a^(-1)$
  such that $a a^(-1) = a^(-1) a = 1$
  (the first equality follows directly if $R$ is finite or commutative)
  is said to be a *unit*. The set of all units
  $ R^times = U(R) =
    {a in R mid(|) exists a^(-1) in R : a dot a^(-1) = a^(-1) dot a = 1}. $
  forms a group under multiplication called the *group of units*.
]

== Types

=== Miscellaneous Rings

#definition[Trivial ring][
  A *trivial ring* is defined by $1 = 0$ or $a dot b = 0$ for all $a, b in R$.
  In particular, $R$ is the *zero ring* if $R = {0}$ or hence $|R| = 1$
]

#definition[Division ring][
  A *division ring* (or skew field) is a ring in which
  every nonzero element is a unit.
]

=== Commutative Rings

#definition[Commutative rings][
  / Commutative ring:
    is a ring with commutative multiplication
    (forming an abelian group).
  / Integral domain:
    is a commutative ring with no zero divisors
    and for which $1 != 0$.
    If $a dot b = 0$, then either $a = 0$ or $b = 0$.
  / Integrally closed domain:
    is an integral domain that is equal to
    its own integral closure within its field of fractions.
  / GCD domain:
    is an integral domain where every pair of nonzero elements
    has a greatest common divisor (GCD).
  / Unique Factorization Domain (UFD):
    is ring where every nonzero element that is not a unit
    can be written as a product of irreducible elements,
    and this factorization is unique up to
    the order of factors and multiplication by units.
  / Principal Ideal Domain (PID):
    is an integral domain where every ideal is principal,
    i.e., generated by a single element.
  / Euclidean Domain:
    is an integral domain equipped with a Euclidean function
    that allows a form of the division algorithm.
  / Field:
    is a commutative division ring.
]

#definition[Noetherian ring][
  A commutative ring $R$ with $1$ is *Noetherian*
  if every ideal of $R$ is finitely generated.
]

#theorem[Ring class inclusions][
  $
    "rngs"
    &supset "rings" \
    &supset "commutative rings" \
    &supset "integral domains" \
    &supset "integrally closed domains" \
    &supset "GCD domains" \
    &supset "unique factorization domains (UFDs)" \
    &supset "principal ideal domains (PIDs)" \
    &supset "Euclidean domains" \
    &supset "fields" \
    &supset "algebraically closed fields"
  $
]

#image("assets/image-10.png")

#theorem[Fundamental of arithmetic][
  The integers $ZZ$ are a Unique Factorization Domain.
]

#theorem[
  Assume $a, b, c$ are elements of a ring where $a$ is not a zero divisor.
  If $a b = a c$ then $a = 0$ or $b = c$.
]

If the ring is an integral field, any element can be chosen as $a$.

#corollary[
  Any finite integral domain is a field.
]

=== Rings of Fractions

== Ideals

=== Definition

#definition[Ideal][
  A subset $I$ of $R$ is a *left ideal* of $R$ if
  + $I$ is a subring of $R$, and
  + $r I subset.eq I$ for all $r in R$.
  If $I$ is both a left and right ideal, then $I$ is an *ideal*.
]

#definition[
  Let $(A)$ denote the smallest ideal of $R$ containing a subset $A$.
  + $(A)$ is the *ideal generated by $A$*.
  + $(A)$ is a *finitely generated ideal* if $A$ is finite.
  + $(a)$ is a *principal ideal* if $a$ is an element.
]

#theorem[
  An element $a in R$ is a non-unit if and only if $(a)$ is a proper ideal.
]

#theorem[Krull's][
  Every proper ideal of a commutative ring with identity
  is contained in at least one maximal ideal.
]

=== Quotient Rings

#theorem[
  Let $I$ be an ideal of $R$.
  Then the (additative) quotient group $R slash I$
  is a ring under the binary operations
  $ (r + I) + (s + I) = (r + s) + I
    space "and" space
    (r + I) dot (s + I) = (r dot s) + I $
  for all $r, s in R$.

  Conversely, if $I$ is any subgroup such that
  the above operations are well-defined,
  then $I$ is an ideal of $R$.
]

#definition[Quotient ring][
  The *quotient ring* of a ring $R$ by an ideal $I$ is $R slash I$
  with the operations as defined above.
]

=== Maximal and Prime Ideals

#definition[Maximal ideal][
  An ideal $M$ in a ring $S$ is *maximal* if $M != S$ and
  the only ideals containing $M$ are $M$ and $S$.
]

Let $I$ be an ideal.

#theorem[
  $I = R$ if and only if the ideal $I$ contains a unit.
]

Assume $R$ is commutative.

#definition[Prime ideal][
  An ideal $P$ is a *prime ideal* if $P != R$
  and whenever $a b in P$ for some $a, b in R$,
  then $a in P$ or $b in P$.
]

#theorem[
  + $R$ is a field if and only if its only ideals are $0$ and $R$.
  + $I$ is maximal if and only if $R slash I$ is a field.
  + $I$ is prime if and only if $R slash I$ is an integral domain.
  + Every maximal ideal of $R$ is prime.
]

== Polynomial Rings

#theorem[
  #set enum(
    number-align: start,
    numbering: n => (sym.checkmark, sym.crossmark).at(n - 1),
  )

  Inheritance from $R$ for the polynonimal ring $R[x]$:
  + integral domain, UFD, Noetherian
  + field, PID, Euclidean domain, Dedekind

  Inheritance for the ring of formal power series $R[x]$
  is very similar.
]

== ?

#definition[
  Let $R$ be an integral domain.

  A non-zero, non-unit element $r in R$ is *irreducible*
  if whenever $r = a b$ for $a, b in R$, either $a$ or $b$ is a unit in $R$.
  Otherwise, it is *reducible*.

  A non-zero, non-unit element $p in R$ is *prime*
  if whenever $p | a b$ for $a, b in R$, then $p | a$ or $p | b$.
  In other words, if it cannot be factored into a product of two nonunits.

  Two elements $a, b in R$ are *associated* (or *associates*)
  if $a | b$ and $b | a$,
  which in an integral domain is equivalent to $a = u b$
  for some unit $u in R$.
]

#theorem[
  In an integral domain, every prime element is irreducible.
]

#proof[
  Suppose $(p)$ is a nonzero prime ideal and $p = a b$.
  Then $a b in (p)$ so, by definition of prime ideal, one of $a$ or $b$,
  say $a$, is in $(p)$. Thus, $a = p r$ for some $r$.
  This implies $p = a b = p r b$ so $r b = 1$ and $b$ is a unit.
]

#theorem[
  In a Unique Factorization Domain,
  a nonzero element is prime if and only if it is irreducible.
]

#theorem[
  Let $R$ be a commutative ring.
  If $a, b in R$ are nonzero elements which generate a principal ideal
  $(a, b) = (d)$, then $d$ is a greatest common divider of $a$ and $b$.
]

Let $R$ be a Principal Ideal Domain.

#theorem[Bézout's identity][
  If $a, b in R$, then any greatest common divisor $d = gcd(a, b)$ satisfies
  $ a x + b y = d quad "for some" x, y in R. $
]

#definition[Coprime][
  Two elements are *coprime* if all their common factors are units.
]

#corollary[
  Two elements $a, b in R$ are coprime if and only if
  $ a x + b y = 1 quad "for some" x, y in R. $
]

= Fields

== Definition

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

#theorem[
  All finite fields of a given order are isomorphic.
]

== Properties

== Vector Spaces

#definition[Vector space][
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
