# Grover's Search Algorithm

> **Category**: search &nbsp;|&nbsp; **Difficulty**: intermediate &nbsp;|&nbsp; **Qubits**: 3 &nbsp;|&nbsp; **Gates**: 13 &nbsp;|&nbsp; **Depth**: 8

Grover's algorithm searches an unstructured database of N items in O(√N) queries, compared to O(N) classically. The algorithm applies a phase oracle to mark the target state, followed by a diffusion operator that amplifies its amplitude. After O(√N) iterations, the target is measured with high probability. This circuit searches a 2-qubit space (N=4) for |11⟩ using a phase kickback oracle.

## Expected Output

~100% |11⟩ (c[0]=1, c[1]=1) after one Grover iteration

## Circuit

The OpenQASM 2.0 circuit is in [`circuit.qasm`](./circuit.qasm).

```
OPENQASM 2.0;
include "qelib1.inc";
// Grover's search — 2 qubit space, target |11>, one iteration
// q[0..1]: search register, q[2]: phase-kickback ancilla
qreg q[2];
qreg a[1];
creg c[2];
// Prepare ancilla in |->, which enables phase kickback
x a[0];
h a[0];
// Superpose search register
h q[0];
h q[1];
// Oracle: marks |11> with phase -1 via Toffoli + phase kickback
ccx q[0],q[1],a[0];
// Diffusion operator: 2|s><s| - I  (s = uniform superposition)
h q[0]; h q[1];
x q[0]; x q[1];
h q[1];
cx q[0],q[1];
h q[1];
x q[0]; x q[1];
h q[0]; h q[1];
measure q[0] -> c[0];
measure q[1] -> c[1];
```

## Tags

`search` `grover` `amplitude-amplification` `quadratic-speedup`

## References

- [Grover, L.K. (1996). A Fast Quantum Mechanical Algorithm for Database Search. STOC '96](https://doi.org/10.1145/237814.237866)

## License

MIT — part of the [OpenQC Algorithm Catalog](https://github.com/openqc-algorithms).
