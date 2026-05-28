     1|---
     2|title: "DDIA — Encoding and Evolution"
     3|description: "Chapter 4: Schema evolution, Protobuf, Avro, backward/forward compatibility."
     4|tags:
     5|  - ddia
     6|  - encoding
     7|  - schema
     8|  - protobuf
     9|  - avro
    10|---
    11|
    12|# Encoding and Evolution
    13|
    14|Chapter 4 of [[Designing Data-Intensive Applications]].
    15|
    16|## The Challenge
    17|
    18|Data outlives code. Schema changes are inevitable. The key challenge: **how to evolve schemas without breaking existing systems.**
    19|
    20|### Compatibility Types
    21|
    22|| Type | Definition |
    23||------|-----------|
    24|| **Backward compatibility** | New code reads old data |
    25|| **Forward compatibility** | Old code reads new data |
    26|
    27|## Encoding Formats
    28|
    29|### Text Formats
    30|
    31|| Format | Pros | Cons |
    32||--------|------|------|
    33|| **JSON** | Human-readable, widespread | Verbose, vague types |
    34|| **XML** | Schema validation (XSD) | Very verbose |
    35|| **CSV** | Simple | No schema, ambiguous |
    36|
    37|### Binary Formats
    38|
    39|| Format | Schema | Compatibility | Used By |
    40||--------|--------|---------------|---------|
    41|| **Protocol Buffers** | Tags in schema | Backward + Forward | gRPC, Google |
    42|| **Apache Thrift** | Tags in schema | Backward + Forward | Facebook |
    43|| **Avro** | Writer/reader schema | Backward + Forward | Hadoop, Kafka |
    44|
    45|### Protobuf vs Avro
    46|
    47|| Aspect | Protobuf | Avro |
    48||--------|----------|------|
    49|| **Schema** | Explicit field tags | Implicit (position-based) |
    50|| **Code generation** | Required | Optional |
    51|| **Dynamic schemas** | Harder | Easier (writer/reader split) |
    52|| **Kafka integration** | Schema Registry | Schema Registry |
    53|
    54|## Schema Evolution
    55|
    56|### Best Practices
    57|
    58|1. **Use default values** for new fields
    59|2. **Never remove required fields** (rename instead)
    60|3. **Keep field numbers stable** in Protobuf
    61|4. **Test compatibility** before deploying
    62|
    63|### Evolution Patterns
    64|
    65|```
    66|Version 1: { name: string, age: int }
    67|Version 2: { name: string, age: int, email: string = "" }  ← new field with default
    68|Version 3: { name: string, age: int, email: string = "", phone: string = "" }  ← another default
    69|```
    70|
    71|## Dataflow Modes
    72|
    73|| Mode | Description | Schema Evolution |
    74||------|-------------|------------------|
    75|| **Database** | Data outlives code | Migrations, careful evolution |
    76|| **RPC** | Remote calls | API versioning |
    77|| **Messaging** | Async via brokers | Producer/consumer schema |
    78|
    79|## Related
    80|- [[Designing Data-Intensive Applications]]
    81|- [[DDIA — Data Models]]
    82|