#set text(font: "New Computer Modern", size: 14pt)

#set page(paper: "a4")

#align(right, box([
  #set text(size: 25pt)

  *Sorting Algorithms - Insertion Sort*

  #set text(size: 18pt)

  CSC 413 - _Algorithms & Complexity Analysis_

  #line(length: 100%)

  _David Peculiar Olorunsola_ - 19CD026583

  _Abiola Oluwafikunayomi_ - 20CD028223

  _Arokoyo Miracle Omonori_ - 20CD028233

  _Ebofin Iyioluwa Emmanuella_ - 20CD028243

  _Mojoyinola Omotola_ - 20CD028253

  _First Okonkwo_ - 20CD028263

  _Chukwuebuka Ubah_ - 20CD028273

  _Oluwatimilehin Adekunle_ - 20CG028033

  _Tochukwu Akpa_ - 20CG028043

  _Oluwafisayomi Babatunde_ - 20CG028053

  _John Daudu_ - 20CG028063

  _Oghenetega Eko-Brotobor_ - 20CG028073

  _Daniel Faji_ - 20CG028083

  _Daniel Joseph-Osawe_ - 20CG028093

  _Fumnanya Mowete_ - 20CG028103

  _Joyce Oludele_ - 20CG028123

  _Toluwani Osin Oluwapelumi_ - 20CG028133

  _Sophia Oghenekvwe Umukoro_ - 20CG028143
]))

#pagebreak(weak: true)

#set page(header: align(right)[_Sorting Algorithms - Insertion Sort_])

= Description

The insertion sort algorithm was formally defined by John Mauchly in 1946, in
the first published discussion of computer sorting - _The Theory and Techniques for Design of Electronic Digital Computers_ @thocp.

However, its use predates computing as it is a natural way for humans to sort
items - when people manually sort cards in a hand, most use a method that is
similar to insertion sort @algo.

Its efficient for tiny sets of data and is stable (it does not change the
relative order of equal keys). In addition to these, it also sorts elements "in
place" -- without allocating extra memory.

It works by iterating through the elements in the array and growing the final
sorted version by comparing each element to the largest value in the sorted
sub-list (which would be the previous element) and placing them in the correct
order.

= Example

Consider an example array:

#align(
  center,
  [
    A = #box(
      baseline: 30%,
      table(columns: (auto, auto, auto, auto, auto), [3], [1], [4], [2], [5]),
    )
  ],
)

+ Initially, the first two elements - `A[0]` and `A[1]` are compared:

  #align(center, [
    #table(
      columns: (auto, auto, auto, auto, auto),
      fill: (silver, red, white, white, white),
      [3],
      [1],
      [4],
      [2],
      [5],
    )
  ])

  Here, 3 is greater than 1, hence they are not in the ascending order and `A[1]`
  is not at its correct position.

  Thus, swap 1 and 3 - making our sorted sub-list now comprise of the first two
  elements.

  #align(center, [
    #table(
      columns: (auto, auto, auto, auto, auto),
      fill: (silver, silver, white, white, white),
      [1],
      [3],
      [4],
      [2],
      [5],
    )
  ])

+ Now, we compare the next two elements - `A[1]` and `A[2]`:

  #align(center, [
    #table(
      columns: (auto, auto, auto, auto, auto),
      fill: (silver, silver, red, white, white),
      [1],
      [3],
      [4],
      [2],
      [5],
    )
  ])

  4 is already greater than 3, so we continue on.

  #align(center, [
    #table(
      columns: (auto, auto, auto, auto, auto),
      fill: (silver, silver, silver, white, white),
      [1],
      [3],
      [4],
      [2],
      [5],
    )
  ])

+ We compare the next two, `A[2]` and `A[3]`:

  #align(center, [
    #table(
      columns: (auto, auto, auto, auto, auto),
      fill: (silver, silver, silver, red, white),
      [1],
      [3],
      [4],
      [2],
      [5],
    )
  ])

  We swap 4 and 2, as they're not in order.

  #align(center, [
    #table(
      columns: (auto, auto, auto, auto, auto),
      fill: (silver, silver, red, silver, white),
      [1],
      [3],
      [2],
      [4],
      [5],
    )
  ])

  After swapping, 3 and 2 are still not in order, so we swap them too.

  #align(center, [
    #table(
      columns: (auto, auto, auto, auto, auto),
      fill: (silver, red, silver, silver, white),
      [1],
      [2],
      [3],
      [4],
      [5],
    )
  ])

  2 is greater than 1, so we continue on.

  #align(center, [
    #table(
      columns: (auto, auto, auto, auto, auto),
      fill: (silver, silver, silver, silver, white),
      [1],
      [2],
      [3],
      [4],
      [5],
    )
  ])

+ We compare the final two elements, `A[3]` and `A[4]`:

  #align(center, [
    #table(
      columns: (auto, auto, auto, auto, auto),
      fill: (silver, silver, silver, silver, red),
      [1],
      [2],
      [3],
      [4],
      [5],
    )
  ])

  4 is greater than 5, so the list is sorted.

  #align(center, [
    #table(
      columns: (auto, auto, auto, auto, auto),
      fill: (silver, silver, silver, silver, silver),
      [1],
      [2],
      [3],
      [4],
      [5],
    )
  ])

= Formal definition

We formally define the algorithm as follows (for a zero-based indexing array):

```pascal
procedure insertion_sort (array: list of sortable items)
    i ⟵ 1

    while i < length(array)
        j ⟵ i
        while j > 0 and array [j - 1] > array[j]
            swap array [j - 1] and array[j]
            j ⟵ j - 1
        end while
        i ⟵ i + 1
    end while
end procedure
```

Here, `⟵` denotes assignment, e.g. `x ⟵ y` means that the value of `x` changes
to the value of `y`.

The outer loop runs over the elements starting from the second one - `array[1]`.
The inner loop then moves element `array[i]` to its correct place so that after
the loop, the first `i + 1` elements are sorted.

= Implementation

An implementation that takes input from the user in C++:

#raw(read("insertion.cpp"), lang: "cpp")

Sample run:

```bat
$ g++ insertion.cpp -o ./insertion
$ ./insertion
Enter the array elements separated by spaces: 3 1 4 2 5
1 2 3 4 5
```

= Time complexity

The runtime of the algorithm is closely related to the number of _inversions_ in
the array -- where an inversion is a pair of elements that are out of order
@stack.

While sorting, the algorithm shifts elements around to their correct position by
swapping them if they form an inversion. Therefore, a sorted array would have 0
inversions - because every element is bigger than the one before and smaller
than the one after.

From our algorithm, the time complexity $T(n)$ can be the addition of the number
of elements in the array, $n$ comparisons (the outer loop) and the number of
swaps that occur in each of the inner loops.

Given that the number of swaps equals the number of inversions $I$, we can then
define out time complexity $T(n)$ as, $ T(n) = n "comparisons" + I "swaps" $

== Best case - $Omega(n)$

The best case input is an array that is already sorted -- which means it has no
inversions. In this case the running time is linear -- $Omega(n + 0) = Omega(n)$.

In the main iteration every element is compared with the last element of the
sorted sub-section, i.e. the element just before, and no swaps occur.

== Worst case - $O(n^2)$

The simplest worst case input is an array that's in reverse order. This results
in every iteration having to scan and shift the entire sorted sub-section in
order to insert the elements.

Therefore, for every element in the array, the inner loop will run $i$ times,
where $i$ is the index of the element. This leads to $ I = 1 + 2 + 3 + ... + (n - 1) = n(n - 1)/2 $

$therefore T(n) = (n + n(n - 1)/2)$, which results in a quadratic running time
-- $O(n^2)$.

== Average case - $Theta(n^2)$

For each of the $n(n - 1)/2$ possible inversions between distinctly-positioned
pairs of elements, on average about half of them will be inversions, and half
will not. So we can establish that the average number of inversions is $I = n(n - 1)/4$.

$therefore T(n) = (n + n(n - 1)/4)$, which also results in a quadratic running
time -- $Theta(n^2)$.

= Space complexity

As the algorithm only moves elements around in the array and does not allocate
any extra memory, the total space complexity in all cases is $O(n)$, where $n$ is
the number of elements in the array.

The auxilary space complexity is $O(1)$ -- it has a constant space requirement
regardless of the size of the input data.

= Real life applications

+ _Sorting a small list of numbers and datasets:_ Insertion sort is efficient for
  sorting a small list of numbers. Its advantage lies in its simplicity and
  effectiveness when dealing with a limited number of elements. For example, if
  you have a list of 10 or 20 numbers that need sorting, insertion sort can
  perform this task quickly without requiring much computational overhead.

+ _Online Algorithms:_ Its ability to work efficiently with live data makes
  insertion sort suitable for online algorithms. For instance, when continuously
  receiving new data elements and needing to maintain a sorted list, insertion
  sort can be effective.

+ _Organizing cards in a card game:_ In card games, particularly those that
  involve maintaining a player's hand in a sorted order (like a hand of playing
  cards), insertion sort can be useful. When a player receives a new card,
  insertion sort can quickly find the correct position for the new card within the
  already sorted hand by comparing it to the existing cards, maintaining the
  hand's order efficiently.

+ _Educational Purposes:_ Insertion sort is often used as an introductory
  algorithm in computer science courses to teach the concept of sorting algorithms
  due to its simple logic and ease of understanding.

#bibliography("ref.yml", style: "american-psychological-association")