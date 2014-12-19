from libc.stdint cimport uint8_t, uint32_t

from .typedefs cimport flags_t, attr_t, id_t, hash_t


cdef struct Lexeme:
    flags_t flags
   
    attr_t id
    attr_t sic
    attr_t dense
    attr_t shape
    attr_t prefix
    attr_t suffix
 
    attr_t length
    attr_t cluster
    attr_t pos_type

    float prob
    float sentiment


cdef struct Morphology:
    uint8_t number
    uint8_t tenspect # Tense/aspect/voice
    uint8_t mood
    uint8_t gender
    uint8_t person
    uint8_t case
    uint8_t misc


cdef struct PosTag:
    Morphology morph
    int id
    int pos


cdef struct TokenC:
    const Lexeme* lex
    Morphology morph
    int idx
    int pos
    int lemma
    int sense
    int head
    int dep_tag
    uint32_t l_kids
    uint32_t r_kids


cdef struct Utf8Str:
    id_t i
    hash_t key
    unsigned char* chars
    int length


cdef struct UniStr:
    Py_UNICODE* chars
    size_t n
    hash_t key
