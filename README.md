# CambodiaCensus — Open Subnational Multi-Variable Census Observatory & Repository (1998–2019 · v5)



**Author:** Favio Leiva  

**Powered by:** Gemini 4 Neon via Antigravity  

**Interactive Observatory:** [https://favioleiva.github.io/CambodiaCensus/](https://favioleiva.github.io/CambodiaCensus/) *(root `index.html`)*  

**Repository:** [https://github.com/Favioleiva/CambodiaCensus](https://github.com/Favioleiva/CambodiaCensus)



---



## Overview



**CambodiaCensus (v5)** is an open, reproducible subnational census observatory and aggregated open-data repository for Cambodia covering the three modern national population censuses (**1998**, **2008**, and **2019**).



It combines:

1. A **trilingual (`ES` · `EN` · `ខ្មែរ`) interactive web observatory** (`index.html`) harmonized discretely (100% 1-to-1 majority-area assignment, **no commune splitting**) onto the **202-unit `Quarcs Cambodia shapefile 202`** (`197` inhabited land districts + `5` `Tonlé Sap` lake water-body sectors strictly `NA`), featuring **125 audited indicators** across **14 thematic blocks**, zoom/pan, a cyan selection focus square, live **Top 10 / Bottom 10** rankings, and direct CSV/JSON downloads.

2. A **complete open repository of aggregated census tables** across all administrative levels (Provinces, Districts, Communes, and Villages for 1998 and 2008; 100% NIS REDATAM/CSPro `.dat` Python-streamed commune aggregates for 2019; harmonized 202-district multi-variable panels; discrete crosswalk; trilingual variable dictionary; and GeoJSON boundaries).



> **Privacy & Redistribution Notice:** This repository publishes **only aggregated, publicly distributable census tables and open administrative boundaries**. **No individual-level census microdata** (`.dat`, `.dcf`) are included.



---



## v5 Release Highlights — 125 Audited Indicators across 14 Thematic Blocks (`ES` · `EN` · `ខ្មែរ`)



| Series / Wave Coverage | Indicators | Key Themes |

| :--- | :---: | :--- |

| **Full 3-Wave Panel (`1998 · 2008 · 2019`)** | **`61`** | Population (`+43k` NIS 1998 toggle), age structure, religion, marital status, literacy, **Educational Attainment Index (MoEYS `6–3–3–4`)**, labor force, ISIC sectors, lighting, cooking fuel, drinking water |

| **2-Wave Panel (`2008 · 2019`)** | **`10`** | **Public sewerage network (`toilet_sewer_pct`)** & septic tank (separated from latrines), higher/university education (`15+` & `25+`), adult `25+` schooling index, school attendance (`6+`), housing tenure, disability |

| **2-Wave Panel (`1998 · 2008`)** | **`2`** | Singulate Mean Age at Marriage (`SMAM`, Male & Female) |

| **2019 Deep REDATAM Indicators** | **`52`** | Mean age at first marriage (`P08`), overcrowding (`persons/room`), exclusive toilet, separate kitchen, appliances & agro-mechanization (tractors, *koyaon*, computer, fridge, A/C, boat, internet), **dependent/independent/employer/unpaid family labor**, institutional sectors, high-skill occupations, homemakers vs. students, migration, Khmer & indigenous languages, English/Chinese literacy, fertility (`CEB`), skilled birth attendance, civil registration, and crude death rate |

| **Total by Census Wave** | **`1998`: 63 · `2008`: 73 · `2019`: 123** | **`125` unique web indicators** (`134` documented variables in trilingual dictionary) |



- **2019 Direct CSPro/REDATAM Streaming Provenance:** All 2019 commune counts were computed in single-pass Python streaming over `DataCleanFinalV3_100%_sortedCSPro_NoAbsRes.dat` (`19,147,696` records) using exact byte offsets from `Camb.dcf`, reconciled exactly to `15,552,211` inhabitants (`15,551,637` territorial + `574` institutional code `269999`), `3,553,021` regular households, and `42,464` household deaths.

- **Preah Sihanouk `avg_hh_size` 2019 Fix:** Computed strictly as `pop_in_regular_hh / households_regular` (`C8_HHTYPE = 1`), yielding `4.75` (`1998: 5.84 → 2008: 4.87 → 2019: 4.75`) without institutional dormitory distortion.

- **Pending Microdata-Access Notice (`1998` & `2008`):** Wave gaps in `1998` and `2008` reflect pending institutional access to the `1998` and `2008` REDATAM microdata (see [`docs/METHODOLOGY.md`](docs/METHODOLOGY.md)).



---



## Repository Structure (51 files · 72.29 MB)



```text

CambodiaCensus/

├── index.html                                # Main trilingual interactive web observatory (v5 · 125 indicators)

├── population_1998.png                       # Harmonized 202-unit static map (1998, common log scale)

├── population_2008.png                       # Harmonized 202-unit static map (2008, common log scale)

├── population_2019.png                       # Harmonized 202-unit static map (2019, common log scale)

├── assets/hero-cambodia.jpg                  # Editorial 3D Cambodia dataset hero banner

├── maps/                                     # Exploratory interactive HTML & static PNG maps (native geometries & 2019 communes/mortality)

├── data/

│   ├── panel202_multivar_web.json            # Compact JSON payload powering the v5 observatory (125 indicators, EN/ES/KM)

│   ├── panel202_multivar_web.js              # Browser-ready JS wrapper for offline/file:/// usage

│   ├── harmonized_panel202/                  # 3-wave multi-variable panels (long, wide), 2019 assets & deep indicators, discrete crosswalk

│   ├── census_1998/                          # Full 1998 aggregated tables (Provinces, Districts, Communes, Villages; 126–135 vars)

│   ├── census_2008/                          # Full 2008 aggregated tables (Provinces, Districts, Communes, Villages; 139–141 vars)

│   ├── census_2019/                          # 2019 100% REDATAM aggregated commune & district tables (multi-var, deep, pop/sex, mortality)

│   ├── native_districts/                     # Native-geometry district population tables (1998, 2008, 2019)

│   └── boundaries/                           # Quarcs Cambodia shapefile 202 (district.geojson, province.geojson)

└── docs/

    ├── VARIABLE_DICTIONARY_3WAVE_PANEL202.md # Complete trilingual (EN / ES / ខ្មែរ) dictionary (134 variables)

    ├── VARIABLE_DICTIONARY_3WAVE_PANEL202.csv# UTF-8-BOM CSV copy for Excel/R/Python (134 × 16)

    ├── METHODOLOGY.md                        # Harmonization rules, 1998 conflict exclusion, v4/v5 audit & microdata limitations

    └── VARIABLE_DICTIONARY.md                # Legacy v1/v2 population-only dictionary

```



---



## Published Aggregated Datasets



### Harmonized `Quarcs 202` Panels & Trilingual Dictionary (v5)

| File | Coverage | Rows | Columns | Size |

| :--- | :--- | ---: | ---: | ---: |

| [`data/harmonized_panel202/panel202_multivar_1998_2008_2019_long.csv`](data/harmonized_panel202/panel202_multivar_1998_2008_2019_long.csv) | 1998 · 2008 · 2019 · 202 districts (long) | `606` | `82` | 272.5 KB |

| [`data/harmonized_panel202/panel202_multivar_1998_2008_2019_wide.csv`](data/harmonized_panel202/panel202_multivar_1998_2008_2019_wide.csv) | 1998 · 2008 · 2019 · 202 districts (wide) | `202` | `233` | 256.2 KB |

| [`data/harmonized_panel202/panel202_assets_agromech_2019.csv`](data/harmonized_panel202/panel202_assets_agromech_2019.csv) | 2019 · Household assets & agro-mechanization | `202` | `20` | 27.3 KB |

| [`data/harmonized_panel202/panel202_2019_deep_indicators.csv`](data/harmonized_panel202/panel202_2019_deep_indicators.csv) | 2019 · 37 deep REDATAM indicators | `202` | `42` | 48.0 KB |

| [`data/harmonized_panel202/crosswalk_communes_to_quarcs202_discrete.csv`](data/harmonized_panel202/crosswalk_communes_to_quarcs202_discrete.csv) | 1998–2019 · Discrete 1-to-1 majority-area crosswalk | `4,858` | `9` | 1,307.8 KB |

| [`data/harmonized_panel202/population_panel_1998_2019_long.csv`](data/harmonized_panel202/population_panel_1998_2019_long.csv) | 1998–2019 · Population-only panel (long) | `606` | `8` | 38.5 KB |

| [`data/harmonized_panel202/population_panel_1998_2019_wide.csv`](data/harmonized_panel202/population_panel_1998_2019_wide.csv) | 1998–2019 · Population-only panel (wide, incl. NIS `+43k`) | `202` | `15` | 20.2 KB |

| [`docs/VARIABLE_DICTIONARY_3WAVE_PANEL202.csv`](docs/VARIABLE_DICTIONARY_3WAVE_PANEL202.csv) | Complete trilingual (`EN` / `ES` / `ខ្មែរ`) variable dictionary | `134` | `16` | 49.0 KB |



### Native Census Tables (1998, 2008 & 2019)

| File | Temporal & Territorial Coverage | Rows | Columns | Size |

| :--- | :--- | ---: | ---: | ---: |

| [`data/census_1998/census_1998_communes.csv`](data/census_1998/census_1998_communes.csv) | 1998 · 1,609 communes (ADM3) | `1,609` | `126` | 856.3 KB |

| [`data/census_1998/census_1998_districts.csv`](data/census_1998/census_1998_districts.csv) | 1998 · 184 district polygons / 183 unique (ADM2) | `184` | `126` | 104.7 KB |

| [`data/census_1998/census_1998_provinces.csv`](data/census_1998/census_1998_provinces.csv) | 1998 · 25 provinces (ADM1) | `25` | `126` | 15.6 KB |

| [`data/census_1998/census_1998_villages.csv`](data/census_1998/census_1998_villages.csv) | 1998 · 12,702 villages (ADM4) | `12,702` | `135` | 5,166.4 KB |

| [`data/census_2008/commune_2008.csv`](data/census_2008/commune_2008.csv) | 2008 · 1,621 communes (ADM3) | `1,621` | `141` | 922.7 KB |

| [`data/census_2008/district_2008.csv`](data/census_2008/district_2008.csv) | 2008 · 193 districts (ADM2) | `193` | `140` | 126.1 KB |

| [`data/census_2008/province_2008.csv`](data/census_2008/province_2008.csv) | 2008 · 24 provinces (ADM1) | `24` | `140` | 18.7 KB |

| [`data/census_2008/village_2008.csv`](data/census_2008/village_2008.csv) | 2008 · 14,073 villages (ADM4) | `14,073` | `139` | 7,084.5 KB |

| [`data/census_2019/commune_2019_multivar_aggregated.csv`](data/census_2019/commune_2019_multivar_aggregated.csv) | 2019 · 1,648 communes (multi-variable counters) | `1,648` | `100` | 696.5 KB |

| [`data/census_2019/commune_2019_deep_aggregated.csv`](data/census_2019/commune_2019_deep_aggregated.csv) | 2019 · 1,648 communes (deep REDATAM counters) | `1,648` | `63` | 428.2 KB |

| [`data/census_2019/commune_mortality_2019.csv`](data/census_2019/commune_mortality_2019.csv) | 2019 · 1,633 commune polygons (crude mortality) | `1,633` | `20` | 346.6 KB |

| [`data/census_2019/commune_sex_pop_2019.csv`](data/census_2019/commune_sex_pop_2019.csv) | 2019 · 1,633 commune polygons (pop & sex) | `1,633` | `19` | 306.4 KB |

| [`data/census_2019/district_population_2019.csv`](data/census_2019/district_population_2019.csv) | 2019 · 197 native districts (ADM2) | `197` | `10` | 14.0 KB |

| [`data/native_districts/district_population_1998.csv`](data/native_districts/district_population_1998.csv) | 1998 · 184 native district polygons (+NIS estimates) | `184` | `14` | 21.2 KB |

| [`data/native_districts/district_population_2008.csv`](data/native_districts/district_population_2008.csv) | 2008 · 193 native districts (ADM2) | `193` | `10` | 14.9 KB |



### Open Boundaries (GeoJSON, WGS84)

- [`data/boundaries/district.geojson`](data/boundaries/district.geojson) — **202 units** (`Quarcs Cambodia shapefile 202`, `geo_id`, `name`)

- [`data/boundaries/province.geojson`](data/boundaries/province.geojson) — **25 provinces** (`geo_id`, `name`)



---



## Official Sources & Ecosystem



- **1998 Census CSVs & Shapefiles:** [Open Development Cambodia — Census 1998](https://data.opendevelopmentcambodia.net/dataset/census-1998)

- **2008 Census CSVs & Shapefiles:** [Open Development Cambodia — Census 2008](https://data.opendevelopmentcambodia.net/en/dataset/census-2008)

- **2019 Census (100% REDATAM) & Shapefiles:** [National Institute of Statistics (NIS Cambodia)](https://nis.gov.kh/en/statistical-table/)

- **Reference 202-District Geometry (`Quarcs Cambodia shapefile 202`):** [GDO-Cambodia / QuaRCS Lab](https://quarcs-lab.github.io/geo4cambodia/) ([GitHub](https://github.com/quarcs-lab/geo4cambodia))

- **1998 Conflict-Exclusion Documentation:** [NIS 1998 Final Results (PDF)](https://nis.gov.kh/wp-content/uploads/2025/09/General-Population-Census1998.pdf), [NIS 2008 National Report (PDF)](https://nis.gov.kh/nis/census2008/GPC2008_Report_ENG.pdf), [IPUMS GEO2_KH1998](https://international.ipums.org/international-action/variables/GEO2_KH1998)

- **Sister Observatories & Governance:** [Geo4Bolivia Panel 339](https://geo4bolivialeiva2026.netlify.app/panel339/) · [Geo4Bolivia Satellites](https://geo4boliviasatellitesleiva2026.netlify.app/) · [Geo4Bolivia Agro 2013](https://geo4boliviaagricultureleiva2026.netlify.app/agro2013/) · [Contractual Agentic AI (`AGENTS.md`)](https://github.com/Favioleiva/contractualagenticAI)



---



## Citation



> Leiva, F. (2026). *CambodiaCensus (v5): Open Subnational Multi-Variable Census Observatory and Harmonized 202-District Repository (1998–2019)*. Powered by Gemini 4 Neon via Antigravity. https://github.com/Favioleiva/CambodiaCensus


## Historical extension: UNTAC 1992 (not a population census)

The Advanced Electoral Planning Unit (AEPU) of the United Nations Transitional Authority in Cambodia (UNTAC) gathered data from provincial, district, commune and village administrations in 1992 for electoral planning. Aschmoneit and Thoma published them in 1995. This is neither a population census nor a count of voters alone: the tables distinguish total population, women and people aged 18 or above. Dates and figures differ across administrative levels; the introduction describes inconsistencies and Khmer Rouge controlled localities. This map reuses the accepted historical harmonization without imputing missing data. Comparisons with 1998–2019 are descriptive, not a fully comparable census series.

**Reference:** Aschmoneit, Walter & Thoma, Jochen (1995). Village Population Statistics of Cambodia: The UNTAC Electoral Data of 1992 processed for Development Planning. Phnom Penh. pp. IV–V, XII. [Author-hosted publication](https://www.academia.edu/68662673/Village_population_statistics_of_Cambodia_the_UNTAC_electoral_data_of_1992_processed_for_development_planning). The supplied PDF's title page, foreword and introduction (PDF pages 2, 3 and 5) were checked. Data collection took place in 1992; publication was in 1995.

The source's published population total is **8,823,495**, including **4,142,857 men** and **4,680,638 women**; these are counts recorded by this source, not a claim of exhaustive national enumeration.

- The interactive 1992 layer supports total population, male population, female population, sex ratio (100 × men / women) and female share (100 × women / population). Ratios use two decimals; aggregate ratios use sums before division.
- 186 districts have demographic observations. The other 16 polygons retain explicit status: 10 not covered by UNTAC, one sub-commune split with counts retained in its parent, and five water sectors. Web values are null for these polygons; source CSV/GeoJSON zeros and provenance flags are preserved verbatim.
- Existing 1998, 2008 and 2019 values and the NIS 1998 option are unchanged. Shared scales are extended only where a 1992 value exceeds their prior bounds. Unsupported indicators disable 1992. Temporal changes never bridge a missing year.
- The existing three-wave CSV downloads and dictionary still cover 1998–2019; the 1992 download is a separate, clearly named dataset.
- The static 1992 two-panel map and four-year sex-ratio image are preserved source artifacts. Their original presentation may differ from the interactive layer's explicit missingness mask.
- Inputs are from the accepted Cambodia1992 Contract 04. No OCR, re-harmonization, microdata processing or publication was performed in Contract 13.

## Compact exploration and national comparison (Contract 14)

The exploration panel adapts to the viewport. Map, district summary, reference
comparison and rankings share one workspace; mobile uses Map / Detail / Ranking
views. The original Cambodia colour palette, data and downloads are unchanged.

For counts the comparison is the arithmetic mean over land districts with a
non-missing value in that year and mode. In 1992 this is 8,823,495 / 186 =
47,438.145161290326 persons, not an exhaustive national census average. The five
water polygons and missing territories are excluded. The NIS option affects the
1998 population reference and its valid-district count.

For rates, ratios and means the comparator is the existing `variables[].nat`
reference from the accepted web panel. Its construction is documented in the
original build scripts: population or household weighted district values for
the legacy panel (with the original unweighted fallback where weights are
absent), plus sums-before-division for the five 1992 demographic series. It is
labelled **national reference**, not a newly recomputed exact pooled rate.
The metadata values are preserved, not silently replaced with a new estimator.
Missing metadata produces an unavailable reference. The reference's district
count denotes districts with a valid plotted observation, not a new denominator
for the stored rate. Original rounding remains unchanged.

The line chart uses actual calendar spacing, breaks at missing observations,
and labels its reference for every year with coverage. Count gaps are percent
differences against a positive reference, percentage gaps are percentage points,
and ratio/mean gaps are in their original units. No gap is shown for missing
values or a zero count reference. Choosing an unavailable indicator preserves
the selected year and explicitly asks the visitor to choose an available year.
Only the five existing population-based indicators are available for 1992.

### Historical marking and Khmer geographical labels (requested revision)
The ten districts marked with red hatching in 1992 are those whose `note`
field in `data/census_1992/cambodia1992_harmonized_quarcs_district.csv`
explicitly records Khmer Rouge control or a stronghold and no UNTAC registration.
These are annotations on the existing harmonized districts, not surveyed
military control boundaries. Other missing observations and lake polygons
do not receive this marking. In 1998 the same visual language indicates
census exclusion due to conflict: three original districts mapped to four
harmonized districts, identified by the existing `est98` flag. This is distinct
from the 1992 classification; neither is extrapolated to 2008 or 2019.
The overlay preserves the choropleth values, NA mask and NIS comparison mode.

Khmer district and province labels come from the supplied 1998/2008 census
tables (`Khmer` column), matched by reviewed name aliases within province.
Missing newer names are transcribed from the official NCDD gazetteer:
[Phnom Penh](https://db.ncdd.gov.kh/gazetteer/view/province.castle?pv=12),
[Prey Veng](https://db.ncdd.gov.kh/gazetteer/view/province.castle?pv=14),
[Bavet](https://db.ncdd.gov.kh/gazetteer/view/district.castle?ds=2008), and
[Tboung Khmum](https://db.ncdd.gov.kh/gazetteer/view/province.castle?pv=25).
The Tonle Sap label is ទន្លេសាប. Labels do not replace historical geometries,
codes, statistical data or downloadable source files. Search accepts both
Khmer and Latin names in every language. The evidence directory records
each label's source, row code and alias, plus the ten historical annotations.
