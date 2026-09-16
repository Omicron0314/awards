# Local verification evidence

Date: 2026-09-16 (Asia/Shanghai).

- Lean 4.34.0, x86_64-unknown-linux-gnu, release commit
  `293d5d0c0c3f3dded4688b3ccd6a33939ac5102b`.
- Mathlib 4.34.0, commit `5ed2965256430c3649e86755f9576b54eca72435`.
- `lake build --wfail`: passed (3098 jobs in the proof repository).
- Direct warning-as-error compilation: passed.
- Bundled `leanchecker` replay: passed.
- Source scan found no custom `axiom`, `sorry`, `admit`, `unsafe`, `extern`,
  `native_decide`, or `partial` declaration.
- The four audited declarations depend only on `propext`, `Classical.choice`,
  and `Quot.sound`.

The replay uses the same Lean kernel and is not an independently implemented
checker. The build used Mathlib's precompiled cache and was not a fresh,
network-isolated rebuild of all dependencies. No independent verifier
attestation, curator signature, permanent archive DOI, official sandbox result,
statement-equivalence decision, eligibility decision, or award is asserted.

Reproduce the result with `bash verify.sh`; the immutable upstream commit and
saved local log are linked from the submission README.
