     1|---
     2|title: "DDIA — Data Models"
     3|description: "Chapter 2: Relational, document, and graph data models."
     4|tags:
     5|  - ddia
     6|  - data-models
     7|  - sql
     8|  - nosql
     9|---
    10|
    11|# Data Models and Query Languages
    12|
    13|Chapter 2 of [[Designing Data-Intensive Applications]].
    14|
    15|## Three Data Models
    16|
    17|### Relational Model
    18|
    19|Tables with rows and columns. Strong support for joins and many-to-many relationships.
    20|
    21|**Pros:**
    22|- Better joins
    23|- Better many-to-one and many-to-many relationships
    24|- Schema on write (data integrity enforced)
    25|- Mature query optimization
    26|
    27|**Cons:**
    28|- Rigid schema
    29|- Object-relational impedance mismatch
    30|
    31|### Document Model
    32|
    33|JSON/BSON documents. Good for document-like structures.
    34|
    35|**Pros:**
    36|- Schema flexibility (schema on read)
    37|- Better performance due to data locality
    38|- Natural mapping to application objects
    39|
    40|**Cons:**
    41|- Weak at joins
    42|- Updates require rewrite of whole document
    43|- Read always fetches whole document
    44|
    45|**Examples:** MongoDB, Couchbase, Elasticsearch
    46|
    47|### Graph Model
    48|
    49|Vertices and edges with properties. Ideal for many-to-many relationships and path traversals.
    50|
    51|**Use cases:**
    52|- Social networks
    53|- Recommendation engines
    54|- Knowledge graphs
    55|- Dependency tracking
    56|
    57|**Examples:** Neo4j (property graphs), Amazon Neptune, triple-stores (SPARQL)
    58|
    59|## Comparison
    60|
    61|| Aspect | Relational | Document | Graph |
    62||--------|-----------|----------|-------|
    63|| **Best for** | Complex queries, joins | Hierarchical data | Many-to-many relationships |
    64|| **Schema** | Rigid (on write) | Flexible (on read) | Flexible |
    65|| **Joins** | Excellent | Poor (manual) | Native traversal |
    66|| **Scalability** | Vertical (traditionally) | Horizontal | Varies |
    67|| **Consistency** | Strong | Eventual | Varies |
    68|
    69|## Convergence
    70|
    71|The boundaries are blurring:
    72|- **PostgreSQL** supports JSON columns
    73|- **MongoDB** added joins (lookup aggregation)
    74|- **MySQL** supports JSON
    75|
    76|> **Key insight:** Choose the model that fits your access pattern, not the one that's "trendy."
    77|
    78|## Query Languages
    79|
    80|| Language | Type | Used By |
    81||----------|------|---------|
    82|| **SQL** | Declarative | Relational databases |
    83|| **MongoDB Aggregation Pipeline** | Declarative (JSON) | MongoDB |
    84|| **Cypher** | Declarative | Neo4j |
    85|| **SPARQL** | Declarative | Triple-stores |
    86|| **MapReduce** | Imperative (function-based) | Hadoop, early MongoDB |
    87|
    88|## Related
    89|- [[Designing Data-Intensive Applications]]
    90|- [[DDIA — Storage and Retrieval]]
    91|