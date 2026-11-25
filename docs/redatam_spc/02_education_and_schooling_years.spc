* ==============================================================================
* Geo4Cambodia v4 — 2019 Census (Camb.dic): Literacy, Attendance & MoEYS 6-3-3-4
* Mean Years of Schooling weights: 0, 3, 6, 9, 12, 16 (includes P16C = 88)
* ==============================================================================
RUNDEF Education_2019
    SELECTION ALL

DEFINE PERSON.LITERATE_15P
    AS RECODE PERSON.P15A_LITERACY_KHMER (1 = 1) (ELSE = 0)
    TYPE INTEGER

DEFINE PERSON.EDUC_MOEYS_YRS
    AS RECODE PERSON.P16C_GRADE_COMPLETED
        (0, 88 = 0)
        (1 - 5 = 3)
        (6 = 6)
        (7 - 9, 13, 15 = 9)
        (10 - 12, 14 = 12)
        (16 - 19 = 16)
        (ELSE = MISSING)
    TYPE INTEGER

TABLE T_SCHOOL_ATTEND_6PLUS
    AS FREQUENCY OF COMMUNE.ID BY PERSON.P16A_SCHOOL
    FOR PERSON.P05_AGE1 >= 6

TABLE T_EDUC_LEVELS_15PLUS
    AS FREQUENCY OF COMMUNE.ID BY PERSON.EDUC_MOEYS_YRS
    FOR PERSON.P05_AGE1 >= 15

TABLE T_EDUC_LEVELS_25PLUS
    AS FREQUENCY OF COMMUNE.ID BY PERSON.EDUC_MOEYS_YRS
    FOR PERSON.P05_AGE1 >= 25
