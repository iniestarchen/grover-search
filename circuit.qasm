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
