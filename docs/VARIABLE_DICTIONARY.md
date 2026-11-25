# Variable Dictionary — CambodiaCensus Open Aggregated Repository

This dictionary documents all aggregated tabular datasets published in `data/`.
**No individual-level microdata are included.**

## 1. Harmonized Panel (`data/harmonized_panel202/`)

### `population_panel_1998_2019_wide.csv` (202 rows — Quarcs Cambodia shapefile 202)
| Column | Type | Description |
| :--- | :--- | :--- |
| `geo_id` | string | Standardized district identifier (`KH-01-01` … `KH-25-xx`) matching `data/boundaries/district.geojson` |
| `district_name` | string | District / Krong / Khan name (includes 5 `Tonlé Sap` lake sectors in the 202-unit backbone) |
| `province_id` | string | Province code (`KH-01` … `KH-25`) |
| `province_name` | string | Province name |
| `pop_1998_enumerated` | float / NA | 1998 strictly enumerated population harmonized from ADM3 (`NA` for conflict-excluded areas; sum = `11,437,656`) |
| `pop_1998_nis_adjusted` | float | 1998 population including official NIS estimates for the 3 conflict-excluded districts (`+43,000`; sum = `11,480,656`) |
| `nis_1998_estimate_added` | float | Official NIS 1998 conflict-excluded estimate allocated to this unit (`0` for unaffected districts) |
| `has_1998_nis_estimate` | bool | `True` if unit received `≥100` inhabitants from the 1998 official NIS conflict estimates |
| `pop_2008` | float | 2008 census population harmonized from ADM3 communes (sum = `13,395,682`) |
| `pop_2019` | float | 2019 territorial census population harmonized from ADM3/ADM2 (sum = `15,551,637`; excludes `574` in special code `269999`) |
| `growth_1998_2008_pct` | float | Intercensal population change 1998 (NIS-adjusted) → 2008 (%) |
| `growth_2008_2019_pct` | float | Intercensal population change 2008 → 2019 (%) |
| `growth_1998_2019_pct` | float | Cumulative population change 1998 (NIS-adjusted) → 2019 (%) |
| `rank_2019` | int | 2019 population rank across all 202 units (1 = largest) |

### `population_panel_1998_2019_long.csv` (606 rows = 202 units × 3 censuses)
| Column | Type | Description |
| :--- | :--- | :--- |
| `geo_id`, `district_name`, `province_id`, `province_name` | string | Territorial identifiers |
| `year` | int | Census year (`1998`, `2008`, `2019`) |
| `population` | float | Harmonized population (uses NIS-adjusted series in 1998) |
| `population_enumerated` | float / NA | Strictly enumerated population (`NA` for conflict-excluded areas in 1998) |
| `includes_1998_nis_estimate` | bool | Indicator flagging 1998 conflict-adjusted observations |

### `crosswalk_communes_to_quarcs202_discrete.csv`
| Column | Type | Description |
| :--- | :--- | :--- |
| `year` | int | Source census year (`1998`, `2008`, `2019`) |
| `source_level` | string | `commune_adm3` or `district_adm2_fallback` (for 31 territorial 2019 communes absent from `khm_adm3_un.shp`) |
| `source_code` | string | Zero-padded 6-digit commune code or 4-digit parent district code |
| `geo_id` | string | Target `Quarcs Cambodia shapefile 202` district identifier |
| `inter_area_m2` | float | Metric intersection area in `EPSG:32648` (m²) |
| `src_area_m2` | float | Total source polygon area in `EPSG:32648` (m²) |
| `raw_share` | float | Unnormalized overlap fraction (`inter_area_m2 / src_area_m2`) |
| `weight` | float | Normalized allocation weight (`sum_d weight = 1.0` per source unit) |

## 2. Full Aggregated Census Tables (`1998`, `2008`, `2019`)

### Thematic Variable Blocks in 1998 (ODC, 126–135 cols) & 2008 (ODC, 139–141 cols)
- **Identifiers & area:** `CODE_ID` / `DIST_CODE` / `COMM_CODE` / `VILL_CODE`, Romanized name, `Khmer`, `LAND_AREA` / `AREA`, `XCOOR` / `YCOOR` (2008 villages).
- **Demography & households:** `TOTPOP`, `MALES`, `FEMALES`, `SEXRATIO`, `DENSITY`, `URBAN`, `HHOLDS`/`HH_TOT`, `HHREG`/`HH_REG`, `FHEADS`, `HHSIZE`/`AVG_HS`, age groups (`POPBL15`, `POP1019`, `POP1564`, `POP65OV`, `FEM1549` by sex), `DEPENDENCY`, median age (`TOTMED`, `MALMED`, `FEMMED`, `CW_RATIO` in 2008).
- **Religion & marital status:** `BUDDHIST`, `MUSLIM`, `CHRISTIAN`, `OTH_REL`; `T_/M_/F_` × (`NEVMAR`, `MARRIED`, `WIDOW`, `DIVSEP`), `SMAM_T/M/F`.
- **Education & literacy:** `LIT_T15/M15/F15` (+ `7+` in 1998), school attendance (`ATT_*` / `T/M/F_ATTEND`), attainment (`NOEDUC`, `PRIMNC`/`PNC`, `PRIMAR`/`PRIM`, `LOWSEC`, `SEC`, `HIGHER`/`HIGH`, plus `25+` in 2008).
- **Labor force & sectors:** activity rate (`T/M/F_GAR` / `T/M/F_ACTIVE`), unemployment (`T/M/F_UER`), primary/secondary/tertiary employment shares (`PRIM`, `SEC`, `TER`).
- **Housing, energy, water & sanitation:** lighting (`L_*`), cooking fuel (`F_*`), toilet/sanitation (`T_*`), drinking water (`W_*`), distance to water (`WL_*` in 2008), dwelling tenure (`D_*` in 2008), construction permanence (`BLD_*` in 1998).
- **Other modules:** migration (`MIG_*`, `MREAS*`) and vital rates (`TFR`, `CMR`, `IMR`, `ELIFE`) in 1998; disability by type and sex (`M_/F_SEE/SPEAK/HEAR/MOVE/MENTAL`) in 2008.
- **Unit note:** In 1998, education, lighting, fuel, sanitation, and water indicators are expressed as **percentages (%)**; in 2008 they are **absolute counts** of persons or households.

### 2019 Census Aggregated Tables (`data/census_2019/`, NIS 100% REDATAM)
- `commune_sex_pop_2019.csv`: `SOURCE_ADM` (6-digit commune code), `ADM3_NAME`, `male`, `female`, `total`, `sex_ratio_m_per_100f`, `pct_female`, `pct_male`, `join_status`.
- `commune_mortality_2019.csv`: commune-level deaths by sex (`death_male`, `death_female`, `death_total`), population denominators, and crude mortality rates (`mortality_rate_*` and `*_per_1000`).
- `district_population_2019.csv`: 4-digit district population aggregated from 1,648 REDATAM commune rows joined to `khm_admbnda_adm2_gov_20181004.shp`.

## 3. Complete Dataset Inventory & Column Lists

### `data/census_1998/census_1998_communes.csv`
- **Dimensions:** `1,609` rows × `126` columns (`876,837` bytes)
- **Columns:** `COMM_CODE, COMM_Name, Khmer, AREA_, HHOLDS, HHREG, FHEADS, DENSITY, URBAN, HHSIZE, TOTPOP, MALES, FEMALES, SEXRATIO, POPBL15, MALBL15, FEMBL15, POP1019, MAL1019, FEM1019, POP1564, MAL1564, FEM1564, POP65OV, MAL65OV, FEM65OV, FEM1549, DEPENDENCY, BUDDHIST, MUSLIM, CHRISTIAN, OTH_REL, T_NEVMAR, T_MARRIED, T_WIDOW, T_DIVSEP, M_NEVMAR, M_MARRIED, M_WIDOW, M_DIVSEP, F_NEVMAR, F_MARRIED, F_WIDOW, F_DIVSEP, LIT_T7, LIT_M7, LIT_F7, LIT_T15, LIT_M15, LIT_F15, ATT_NOW_T, ATT_PAST_T, ATT_NEV_T, ATT_NOW_M, ATT_PAST_M, ATT_NEV_M, ATT_NOW_F, ATT_PAST_F, ATT_NEV_F, T_NOEDUC, T_PRIMNC, T_PRIMAR, T_LOWSEC, T_HIGHER, M_NOEDUC, M_PRIMNC, M_PRIMAR, M_LOWSEC, M_HIGHER, F_NOEDUC, F_PRIMNC, F_PRIMAR, F_LOWSEC, F_HIGHER, MIG_POB, MIG_PR, MIG_PR5, MREAS12, MREAS4, MREAS5, MREAS6, MREAS7, TFR, SMAM_M, SMAM_F, CMR, IMR, ELIFE, T_GAR, M_GAR, F_GAR, T_UER, M_UER, F_UER, T_PRIM, T_SEC, T_TER, M_PRIM, M_SEC, M_TER, F_PRIM, F_SEC, F_TER, L_POW, L_GEN, L_PG, L_KEROS, L_BATT, L_OTH, F_WOOD, F_CHAR, F_KEROS, F_LPG, F_OTH, T_YES, T_NO, W_PIPE, W_TUBE, W_WELL, W_RIV, W_BUY, W_OTH, W_SAFE, BLD_PERM, BLD_SEMI, BLD_TEMP`

### `data/census_1998/census_1998_districts.csv`
- **Dimensions:** `184` rows × `126` columns (`107,255` bytes)
- **Columns:** `CODE_ID, Name, Khmer, LAND_AREA, HHOLDS, HHREG, FHEADS, DENSITY, URBAN, HHSIZE, TOTPOP, MALES, FEMALES, SEXRATIO, POPBL15, MALBL15, FEMBL15, POP1019, MAL1019, FEM1019, POP1564, MAL1564, FEM1564, POP65OV, MAL65OV, FEM65OV, FEM1549, DEPENDENCY, BUDDHIST, MUSLIM, CHRISTIAN, OTH_REL, T_NEVMAR, T_MARRIED, T_WIDOW, T_DIVSEP, M_NEVMAR, M_MARRIED, M_WIDOW, M_DIVSEP, F_NEVMAR, F_MARRIED, F_WIDOW, F_DIVSEP, LIT_T7, LIT_M7, LIT_F7, LIT_T15, LIT_M15, LIT_F15, ATT_NOW_T, ATT_PAST_T, ATT_NEV_T, ATT_NOW_M, ATT_PAST_M, ATT_NEV_M, ATT_NOW_F, ATT_PAST_F, ATT_NEV_F, T_NOEDUC, T_PRIMNC, T_PRIMAR, T_LOWSEC, T_HIGHER, M_NOEDUC, M_PRIMNC, M_PRIMAR, M_LOWSEC, M_HIGHER, F_NOEDUC, F_PRIMNC, F_PRIMAR, F_LOWSEC, F_HIGHER, MIG_POB, MIG_PR, MIG_PR5, MREAS12, MREAS4, MREAS5, MREAS6, MREAS7, TFR, SMAM_M, SMAM_F, CMR, IMR, ELIFE, T_GAR, M_GAR, F_GAR, T_UER, M_UER, F_UER, T_PRIM, T_SEC, T_TER, M_PRIM, M_SEC, M_TER, F_PRIM, F_SEC, F_TER, L_POW, L_GEN, L_PG, L_KEROS, L_BATT, L_OTH, F_WOOD, F_CHAR, F_KEROS, F_LPG, F_OTH, T_YES, T_NO, W_PIPE, W_TUBE, W_WELL, W_RIV, W_BUY, W_OTH, W_SAFE, BLD_PERM, BLD_SEMI, BLD_TEMP`

### `data/census_1998/census_1998_provinces.csv`
- **Dimensions:** `25` rows × `126` columns (`16,018` bytes)
- **Columns:** `CODE_ID, NAME, Khmer, LAND_AREA, HHOLDS, HHREG, FHEADS, DENSITY, URBAN, HHSIZE, TOTPOP, MALES, FEMALES, SEXRATIO, POPBL15, MALBL15, FEMBL15, POP1019, MAL1019, FEM1019, POP1564, MAL1564, FEM1564, POP65OV, MAL65OV, FEM65OV, FEM1549, DEPENDENCY, BUDDHIST, MUSLIM, CHRISTIAN, OTH_REL, T_NEVMAR, T_MARRIED, T_WIDOW, T_DIVSEP, M_NEVMAR, M_MARRIED, M_WIDOW, M_DIVSEP, F_NEVMAR, F_MARRIED, F_WIDOW, F_DIVSEP, LIT_T7, LIT_M7, LIT_F7, LIT_T15, LIT_M15, LIT_F15, ATT_NOW_T, ATT_PAST_T, ATT_NEV_T, ATT_NOW_M, ATT_PAST_M, ATT_NEV_M, ATT_NOW_F, ATT_PAST_F, ATT_NEV_F, T_NOEDUC, T_PRIMNC, T_PRIMAR, T_LOWSEC, T_HIGHER, M_NOEDUC, M_PRIMNC, M_PRIMAR, M_LOWSEC, M_HIGHER, F_NOEDUC, F_PRIMNC, F_PRIMAR, F_LOWSEC, F_HIGHER, MIG_POB, MIG_PR, MIG_PR5, MREAS12, MREAS4, MREAS5, MREAS6, MREAS7, TFR, SMAM_M, SMAM_F, CMR, IMR, ELIFE, T_GAR, M_GAR, F_GAR, T_UER, M_UER, F_UER, T_PRIM, T_SEC, T_TER, M_PRIM, M_SEC, M_TER, F_PRIM, F_SEC, F_TER, L_POW, L_GEN, L_PG, L_KEROS, L_BATT, L_OTH, F_WOOD, F_CHAR, F_KEROS, F_LPG, F_OTH, T_YES, T_NO, W_PIPE, W_TUBE, W_WELL, W_RIV, W_BUY, W_OTH, W_SAFE, BLD_PERM, BLD_SEMI, BLD_TEMP`

### `data/census_1998/census_1998_villages.csv`
- **Dimensions:** `12,702` rows × `135` columns (`5,290,386` bytes)
- **Columns:** `VILL_CODE, VILL_NAME, Khmer, X, Y, TOTHH, REGHH, MALES, FEMALES, TOTPOP, MAL_0_4, MAL_5_9, MAL_10_14, MAL_15_19, MAL_20_24, MAL_25_29, MAL_30_34, MAL_35_39, MAL_40_44, MAL_45_49, MAL_50_54, MAL_55_59, MAL_60_64, MAL_65_69, MAL_70_74, MAL_75, FEM_0_4, FEM_5_9, FEM_10_14, FEM_15_19, FEM_20_24, FEM_25_29, FEM_30_34, FEM_35_39, FEM_40_44, FEM_45_49, FEM_50_54, FEM_55_59, FEM_60_64, FEM_65_69, FEM_70_74, FEM_75, O_OWNER, O_RENT, O_FREE, O_OTHER, L_POWER, L_GENERAT, L_POWGEN, L_KEROS, L_CANDLE, L_BATTERY, L_OTHER, F_WOOD, F_CHARCOAL, F_KEROS, F_LPG, F_ELECTRIC, F_NONE, F_OTHER, TOILET, NO_TOILET, W_PIPE, W_TUBE, W_WELL, W_RIVER, W_BUY, W_OTHER, ROOM_1, ROOM_2, ROOM_3, ROOM_4, ROOM_5, ROOM_6, ROOM_7, ROOM_8, ROOM_NR, M_LIT_7, M_LIT_15, M_LIT10_14, M_LIT15_19, M_ATT_NOW, M_ATT_PAST, M_ATT_NEV, M_ATT_6, M_ATT_7, M_ATT_8, M_ATT_9, M_GRAD_0, M_GRAD1_3, M_GRAD_4, M_GRAD_6, M_GRAD_9, M_GRAD_12, F_LIT_7, F_LIT_15, F_LIT10_14, F_LIT15_19, F_ATT_NOW, F_ATT_PAST, F_ATT_NEV, F_ATT_6, F_ATT_7, F_ATT_8, F_ATT_9, F_GRAD_0, F_GRAD1_3, F_GRAD_4, F_GRAD_6, F_GRAD_9, F_GRAD_12, M_HEAD, M_SPOUSE, M_CHILD, M_PARENT, M_GCHILD, M_OTHREL, M_NONREL, M_NOTMAR, M_MARRIED, M_WIDOW, M_DIVOR, M_SEPAR, F_HEAD, F_SPOUSE, F_CHILD, F_PARENT, F_GCHILD, F_OTHREL, F_NONREL, F_NOTMAR, F_MARRIED, F_WIDOW, F_DIVOR, F_SEPAR`

### `data/census_2008/commune_2008.csv`
- **Dimensions:** `1,621` rows × `141` columns (`944,811` bytes)
- **Columns:** `COMM_CODE, COMM_NAME, Khmer, HH_TOT, HH_REG, TOTPOP, MALES, FEMALES, DENSITY, URBAN, FHEADS, SEXRATIO, AVG_HS, MALBL15, MAL1019, MAL1564, MAL65OV, FEMBL15, FEM1019, FEM1564, FEM65OV, POPBL15, POP1019, POP1564, POP65OV, FEM1549, TOTMED, MALMED, FEMMED, DEPENDENCY, CW_RATIO, BUDDHIST, MUSLIM, CHRISTIAN, OTH_REL, SMAM_T, SMAM_M, SMAM_F, T_NEVMAR, T_MARRIED, T_WIDOW, T_DIVSEP, M_NEVMAR, M_MARRIED, M_WIDOW, M_DIVSEP, F_NEVMAR, F_MARRIED, F_WIDOW, F_DIVSEP, T_LIT15, M_LIT15, F_LIT15, T_ATTEND, M_ATTEND, F_ATTEND, M_NOEDUC, M_PNC, M_PRIM, M_LOWSEC, M_SEC, M_HIGH, F_NOEDUC, F_PNC, F_PRIM, F_LOWSEC, F_SEC, F_HIGH, M25_NO, M25_PNC, M25_PRIM, M25_LS, M25_SEC, M25_HIGH, F25_NO, F25_PNC, F25_PRIM, F25_LS, F25_SEC, F25_HIGH, M_SEE, M_SPEAK, M_HEAR, M_MOVE, M_MENTAL, F_SEE, F_SPEAK, F_HEAR, F_MOVE, F_MENTAL, T_ACTIVE, M_ACTIVE, F_ACTIVE, T_PRIMSEC, T_SECSEC, T_TERSEC, M_PRIMSEC, M_SECSEC, M_TERSEC, F_PRIMSEC, F_SECSEC, F_TERSEC, T_UER, M_UER, F_UER, D_OWN, D_RENT, D_FREE, D_OTH, L_CITY, L_GEN, L_CG, L_KERO, L_CAND, L_BATT, L_OTH, F_FIRE, F_CHAR, F_KEROS, F_LPG, F_ELEC, F_NONE, F_OTH, T_NOT, T_SEW, T_SEP, T_PIT, T_OTH, W_PIPED, W_TUBED, W_PROTECT, W_UNPROT, W_RAIN, W_SPRING, W_BOUGHT, W_OTHER, WL_WITHIN, WL_NEAR, WL_AWAY, AREA, NOTE`

### `data/census_2008/district_2008.csv`
- **Dimensions:** `193` rows × `140` columns (`129,078` bytes)
- **Columns:** `DIST_CODE, DIST_NAME, Khmer, HH_TOT, HH_REG, TOTPOP, MALES, FEMALES, DENSITY, URBAN, FHEADS, SEXRATIO, AVG_HS, MALBL15, MAL1019, MAL1564, MAL65OV, FEMBL15, FEM1019, FEM1564, FEM65OV, POPBL15, POP1019, POP1564, POP65OV, FEM1549, TOTMED, MALMED, FEMMED, DEPENDENCY, CW_RATIO, BUDDHIST, MUSLIM, CHRISTIAN, OTH_REL, SMAM_T, SMAM_M, SMAM_F, T_NEVMAR, T_MARRIED, T_WIDOW, T_DIVSEP, M_NEVMAR, M_MARRIED, M_WIDOW, M_DIVSEP, F_NEVMAR, F_MARRIED, F_WIDOW, F_DIVSEP, T_LIT15, M_LIT15, F_LIT15, T_ATTEND, M_ATTEND, F_ATTEND, M_NOEDUC, M_PNC, M_PRIM, M_LOWSEC, M_SEC, M_HIGH, F_NOEDUC, F_PNC, F_PRIM, F_LOWSEC, F_SEC, F_HIGH, M25_NO, M25_PNC, M25_PRIM, M25_LS, M25_SEC, M25_HIGH, F25_NO, F25_PNC, F25_PRIM, F25_LS, F25_SEC, F25_HIGH, M_SEE, M_SPEAK, M_HEAR, M_MOVE, M_MENTAL, F_SEE, F_SPEAK, F_HEAR, F_MOVE, F_MENTAL, T_ACTIVE, M_ACTIVE, F_ACTIVE, T_PRIMSEC, T_SECSEC, T_TERSEC, M_PRIMSEC, M_SECSEC, M_TERSEC, F_PRIMSEC, F_SECSEC, F_TERSEC, T_UER, M_UER, F_UER, D_OWN, D_RENT, D_FREE, D_OTH, L_CITY, L_GEN, L_CG, L_KERO, L_CAND, L_BATT, L_OTH, F_FIRE, F_CHAR, F_KEROS, F_LPG, F_ELEC, F_NONE, F_OTH, T_NOT, T_SEW, T_SEP, T_PIT, T_OTH, W_PIPED, W_TUBED, W_PROTECT, W_UNPROT, W_RAIN, W_SPRING, W_BOUGHT, W_OTHER, WL_WITHIN, WL_NEAR, WL_AWAY, AREA`

### `data/census_2008/province_2008.csv`
- **Dimensions:** `24` rows × `140` columns (`19,103` bytes)
- **Columns:** `PROV_CODE, PROV_NAME, Khmer, HH_TOT, HH_REG, TOTPOP, MALES, FEMALES, DENSITY, URBAN, FHEADS, AVG_HS, SEXRATIO, MALBL15, MAL1019, MAL1564, MAL65OV, FEMBL15, FEM1019, FEM1564, FEM65OV, POPBL15, POP1019, POP1564, POP65OV, FEM1549, TOTMED, MALMED, FEMMED, DEPENDENCY, CW_RATIO, BUDDHIST, MUSLIM, CHRISTIAN, OTH_REL, SMAM_T, SMAM_M, SMAM_F, T_NEVMAR, T_MARRIED, T_WIDOW, T_DIVSEP, M_NEVMAR, M_MARRIED, M_WIDOW, M_DIVSEP, F_NEVMAR, F_MARRIED, F_WIDOW, F_DIVSEP, T_LIT15, M_LIT15, F_LIT15, T_ATTEND, M_ATTEND, F_ATTEND, M_NOEDUC, M_PNC, M_PRIM, M_LOWSEC, M_SEC, M_HIGH, F_NOEDUC, F_PNC, F_PRIM, F_LOWSEC, F_SEC, F_HIGH, M25_NO, M25_PNC, M25_PRIM, M25_LS, M25_SEC, M25_HIGH, F25_NO, F25_PNC, F25_PRIM, F25_LS, F25_SEC, F25_HIGH, M_SEE, M_SPEAK, M_HEAR, M_MOVE, M_MENTAL, F_SEE, F_SPEAK, F_HEAR, F_MOVE, F_MENTAL, T_ACTIVE, M_ACTIVE, F_ACTIVE, T_PRIMSEC, T_SECSEC, T_TERSEC, M_PRIMSEC, M_SECSEC, M_TERSEC, F_PRIMSEC, F_SECSEC, F_TERSEC, T_UER, M_UER, F_UER, D_OWN, D_RENT, D_FREE, D_OTH, L_CITY, L_GEN, L_CG, L_KERO, L_CAND, L_BATT, L_OTH, F_FIRE, F_CHAR, F_KEROS, F_LPG, F_ELEC, F_NONE, F_OTH, T_NOT, T_SEW, T_SEP, T_PIT, T_OTH, W_PIPED, W_TUBED, W_PROTECT, W_UNPROT, W_RAIN, W_SPRING, W_BOUGHT, W_OTHER, WL_WITHIN, WL_NEAR, WL_AWAY, AREA`

### `data/census_2008/village_2008.csv`
- **Dimensions:** `14,073` rows × `139` columns (`7,254,506` bytes)
- **Columns:** `VILL_CODE, VILL_NAME, Khmer, HH_TOT, HH_REG, TOTPOP, MALES, FEMALES, FHEADS, SEXRATIO, AVG_HS, MALBL15, MAL1019, MAL1564, MAL65OV, FEMBL15, FEM1019, FEM1564, FEM65OV, POPBL15, POP1019, POP1564, POP65OV, FEM1549, TOTMED, MALMED, FEMMED, DEPENDENCY, CW_RATIO, BUDDHIST, MUSLIM, CHRISTIAN, OTH_REL, SMAM_T, SMAM_M, SMAM_F, T_NEVMAR, T_MARRIED, T_WIDOW, T_DIVSEP, M_NEVMAR, M_MARRIED, M_WIDOW, M_DIVSEP, F_NEVMAR, F_MARRIED, F_WIDOW, F_DIVSEP, T_LIT15, M_LIT15, F_LIT15, T_ATTEND, M_ATTEND, F_ATTEND, M_NOEDUC, M_PNC, M_PRIM, M_LOWSEC, M_SEC, M_HIGH, F_NOEDUC, F_PNC, F_PRIM, F_LOWSEC, F_SEC, F_HIGH, M25_NO, M25_PNC, M25_PRIM, M25_LS, M25_SEC, M25_HIGH, F25_NO, F25_PNC, F25_PRIM, F25_LS, F25_SEC, F25_HIGH, M_SEE, M_SPEAK, M_HEAR, M_MOVE, M_MENTAL, F_SEE, F_SPEAK, F_HEAR, F_MOVE, F_MENTAL, T_ACTIVE, M_ACTIVE, F_ACTIVE, T_PRIMSEC, T_SECSEC, T_TERSEC, M_PRIMSEC, M_SECSEC, M_TERSEC, F_PRIMSEC, F_SECSEC, F_TERSEC, T_UER, M_UER, F_UER, D_OWN, D_RENT, D_FREE, D_OTH, L_CITY, L_GEN, L_CG, L_KERO, L_CAND, L_BATT, L_OTH, F_FIRE, F_CHAR, F_KEROS, F_LPG, F_ELEC, F_NONE, F_OTH, T_NOT, T_SEW, T_SEP, T_PIT, T_OTH, W_PIPED, W_TUBED, W_PROTECT, W_UNPROT, W_RAIN, W_SPRING, W_BOUGHT, W_OTHER, WL_WITHIN, WL_NEAR, WL_AWAY, XCOOR, YCOOR`

### `data/census_2019/commune_mortality_2019.csv`
- **Dimensions:** `1,633` rows × `20` columns (`354,890` bytes)
- **Columns:** `SOURCE_ADM, ADM3_NAME, ADM3_ID, ADM2_ID, ADM1_ID, code_raw, commune_name_census, pop_male, pop_female, pop_total, death_male, death_female, death_total, mortality_rate_male, mortality_rate_female, mortality_rate_total, mortality_per_1000_male, mortality_per_1000_female, mortality_per_1000_total, join_status`

### `data/census_2019/commune_sex_pop_2019.csv`
- **Dimensions:** `1,633` rows × `19` columns (`313,708` bytes)
- **Columns:** `SOURCE_ADM, source_adm_dup_count, ADM3_NAME, ADM3_ALTNM, ADM3_ID, ADM2_ID, ADM1_ID, SOURCE, SHAPE_LENG, SHAPE_AREA, code_raw, commune_name_census, male, female, total, sex_ratio_m_per_100f, pct_female, pct_male, join_status`

### `data/census_2019/district_population_2019.csv`
- **Dimensions:** `197` rows × `10` columns (`14,335` bytes)
- **Columns:** `poly_id, code_4, district_name, ADM1_EN, ADM2_PCODE, commune_count, population, male, female, join_status`

### `data/census_2019/unmatched_codes_audit_2019.csv`
- **Dimensions:** `33` rows × `12` columns (`2,636` bytes)
- **Columns:** `SOURCE_ADM, ADM3_NAME, ADM3_ID, ADM2_ID, ADM1_ID, issue, code_raw, code_6, commune_name_census, male, female, total`

### `data/harmonized_panel202/crosswalk_communes_to_quarcs202_discrete.csv`
- **Dimensions:** `11,972` rows × `8` columns (`1,339,223` bytes)
- **Columns:** `year, source_level, source_code, geo_id, inter_area_m2, src_area_m2, raw_share, weight`

### `data/harmonized_panel202/population_panel_1998_2019_long.csv`
- **Dimensions:** `606` rows × `8` columns (`39,428` bytes)
- **Columns:** `geo_id, district_name, province_id, province_name, year, population, population_enumerated, includes_1998_nis_estimate`

### `data/harmonized_panel202/population_panel_1998_2019_wide.csv`
- **Dimensions:** `202` rows × `14` columns (`20,674` bytes)
- **Columns:** `geo_id, district_name, province_id, province_name, pop_1998_enumerated, pop_1998_nis_adjusted, nis_1998_estimate_added, has_1998_nis_estimate, pop_2008, pop_2019, growth_1998_2008_pct, growth_2008_2019_pct, growth_1998_2019_pct, rank_2019`

### `data/native_districts/district_population_1998.csv`
- **Dimensions:** `184` rows × `14` columns (`21,725` bytes)
- **Columns:** `poly_id, code_4, district_name, Name, population, male, female, LAND_AREA, DENSITY, population_recorded, population_enumerated_na, is_nis_estimate, population_source, join_status`

### `data/native_districts/district_population_2008.csv`
- **Dimensions:** `193` rows × `10` columns (`15,300` bytes)
- **Columns:** `poly_id, code_4, district_name, DIST_NAME, population, male, female, AREA, DENSITY, join_status`

### `data/native_districts/district_population_2019.csv`
- **Dimensions:** `197` rows × `10` columns (`14,335` bytes)
- **Columns:** `poly_id, code_4, district_name, ADM1_EN, ADM2_PCODE, commune_count, population, male, female, join_status`

