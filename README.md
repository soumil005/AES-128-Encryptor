# AES-128 Encryptor
This project implements the **AES-128 (Advanced Encryption Standard)** encryption algorithm using Verilog. The design is modular and includes all major AES stages: key expansion, SubBytes, ShiftRows, MixColumns, and AddRoundKey.

## 🔐 Features

- AES-128 encryption (128-bit key and 128-bit plaintext)
- Follows the standard 10-round AES pipeline
- Modular RTL design
- Simple testbench for functional verification
- Outputs ciphertext in hexadecimal

## Architecture
<img width="734" height="999" alt="image" src="https://github.com/user-attachments/assets/42e0f330-76d1-4105-b5a8-292699bb14eb" />


<img width="899" height="1050" alt="image" src="https://github.com/user-attachments/assets/ac622aa2-ed12-4869-ad64-d505870a9601" />


## Example

**Input:**
- Plaintext: 00112233445566778899aabbccddeeff
- Key:       000102030405060708090a0b0c0d0e0f

**Output:**
- Ciphertext: b0f5db9c74528fb614c24d1783c1d4e6

Verified against [NIST AES test vectors](https://csrc.nist.gov/projects/cryptographic-algorithm-validation-program/block-ciphers).

## Future Work
1. AES Decryption module
2. Support for AES-192 / AES-256
