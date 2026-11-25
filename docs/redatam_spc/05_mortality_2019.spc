* ==============================================================================
* Geo4Cambodia v4 — 2019 Census (Camb.dic): Household Deaths (Last 12 Months)
* Crude Death Rate (per 1,000) = 1000 * COUNT(DEATH_RECORD) / COUNT(PERSON)
* ==============================================================================
RUNDEF Mortality_2019
    SELECTION ALL

TABLE T_DEATHS_COMMUNE
    AS FREQUENCY OF COMMUNE.ID BY DEATH_RECORD.D3_SEX
