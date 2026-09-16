# JSP-000998 / Erdős #1193: formalization submission

## English

Please review this additional Lean formalization of the two negative density
answers in JSP-000998 for intake and eligibility. The proof uses the known example
`A = ℕ`, `g(n) = n + 1`. It claims formalization work only, with no claim to a new
mathematical discovery, first formalization, confirmed recipient, or award.

The added work proves equality between the representation count and indicator
convolution, proves that both densities of the matching set equal one, and
explicitly negates both fully quantified conjectures. The earlier proof cited by
the catalog establishes the counting identity and describes the density
consequences in prose. Whether these additions constitute an eligible contribution
is for the maintainers to assess.

## Fixed proof and evidence

Proof repository: [Omicron0314/lean_syc_proofs](https://github.com/Omicron0314/lean_syc_proofs).
Immutable source commit: `14ad66faaeeb306a4682451c1ec15057598ba055`.

- [Lean source](https://github.com/Omicron0314/lean_syc_proofs/blob/14ad66faaeeb306a4682451c1ec15057598ba055/LeanSyc/JSP000998.lean)
- [Complete statement correspondence and attribution](https://github.com/Omicron0314/lean_syc_proofs/blob/14ad66faaeeb306a4682451c1ec15057598ba055/STATEMENT.md)
- [Pinned dependency manifest](https://github.com/Omicron0314/lean_syc_proofs/blob/14ad66faaeeb306a4682451c1ec15057598ba055/lake-manifest.json)
- [Reproduction script](https://github.com/Omicron0314/lean_syc_proofs/blob/14ad66faaeeb306a4682451c1ec15057598ba055/scripts/verify.sh)
- [Compiler and checker transcript](https://github.com/Omicron0314/lean_syc_proofs/blob/14ad66faaeeb306a4682451c1ec15057598ba055/evidence/verification.txt)
- [Source checksums](https://github.com/Omicron0314/lean_syc_proofs/blob/14ad66faaeeb306a4682451c1ec15057598ba055/evidence/SHA256SUMS)
- [Apache 2.0 license](https://github.com/Omicron0314/lean_syc_proofs/blob/14ad66faaeeb306a4682451c1ec15057598ba055/LICENSE)

## Reproduction

```sh
git clone https://github.com/Omicron0314/lean_syc_proofs.git
cd lean_syc_proofs
git checkout 14ad66faaeeb306a4682451c1ec15057598ba055
lake exe cache get
bash scripts/verify.sh
sha256sum -c evidence/SHA256SUMS
```

Requires elan and Python 3. Set network proxy variables if necessary before
fetching dependencies. Lean is pinned to 4.34.0, and Mathlib to
`5ed2965256430c3649e86755f9576b54eca72435` (v4.34.0).

Audited declarations, all prefixed by `LeanSyc.JSP000998`:

- `sumRep_eq_indicator_convolution`
- `density_one_counterexample`
- `not_lower_density_zero`
- `not_uniform_upper_density_bound`

All four report exactly `[propext, Classical.choice, Quot.sound]`.
`lake build --wfail`, direct compilation with warnings as errors, a prohibited-token
scan of the project Lean source, and bundled `leanchecker` replay passed locally.
The bundled checker uses the same Lean kernel; it is not an independent checker.
Mathlib caches were used, and a network-disabled rebuild of dependencies was not
performed. The repository's record CI does not execute this external proof.
GitHub commit links are pinned but do not constitute an independently preserved
permanent archive; permanent archival remains pending if required.

## Attribution and review requested

The catalog credits Pietro Monticone for the public solution and Lean proof.
The [earlier source](https://github.com/plby/lean-proofs/blob/1268917deaaaa0d674f651287027baa26cea9920/src/latest/ErdosProblems/Erdos1193.lean)
credits Pietro Monticone and Aristotle (Harmonic). Their prior work is explicitly
acknowledged. The original discoverer is not established here. Statement and
definition adaptations credit The Formal Conjectures Authors under Apache 2.0.
The new implementation was prepared on 2026-09-16 with OpenAI Codex assistance.

The proposed formalization recipient is `RECIPIENT-jsp-000998-A`, pending
confirmation. This is a self-submission by the PR author, who has a direct interest
in the outcome; local checking does not constitute independent review.

Please assess whether the explicit density results and complete negations add
eligible formalization value, given the earlier proof and the catalog's stated
uncertainty about original completion dates. No historical bounty is specified
for this entry, and no amount is requested as an established entitlement.

This directory is a proposed evidence-intake location. Please redirect it if a
different location is required. Formal candidate statements require actual
registered curator signatures under `docs/records.md` and the statement schema;
none are asserted or manufactured here. The proof stays in its separate source
repository. No catalog claim flag, candidate or award record, public profile,
reviewer attestation, or generated index is changed by this submission.
