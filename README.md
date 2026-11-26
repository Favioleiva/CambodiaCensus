# CambodiaCensus — Open Subnational Population Observatory & Aggregated Census Repository (1998–2019)

**Author:** Favio Leiva  
**Powered by:** Gemini 4 Neon via Antigravity  
**Interactive Observatory:** [https://favioleiva.github.io/CambodiaCensus/](https://favioleiva.github.io/CambodiaCensus/) *(root `index.html`)*  
**Repository:** [https://github.com/Favioleiva/CambodiaCensus](https://github.com/Favioleiva/CambodiaCensus)

---

## Overview

**CambodiaCensus** is an open, reproducible subnational demographic observatory and aggregated census data repository for Cambodia covering the three modern national population censuses (**1998**, **2008**, and **2019**).

It combines:
1. A **trilingual (`ES` / `EN` / `ខ្មែរ`) interactive web observatory** (`index.html`) harmonized onto the **202-unit `Quarcs Cambodia shapefile 202`** (`GDO-Cambodia`), featuring zoom/pan, a geometric selection focus square, live **Top 10 / Bottom 10** rankings, a toggle between strictly enumerated 1998 observations (`NA` for conflict-excluded areas) and official NIS estimates (`+43,000`), and direct one-click downloads of all datasets.
2. A **complete open repository of processed, aggregated census tables** across all available administrative levels (Provinces, Districts, Communes, and Villages for 1998 and 2008; Communes, Districts, and Mortality for 2019; plus the harmonized 202-district panel, metric area crosswalk, and GeoJSON boundaries).

> **Privacy & Redistribution Notice:** This repository publishes **only aggregated, publicly distributable census tables and open administrative boundaries**. **No individual-level census microdata** are included.

---


---

## v4 Release Highlights — Audited Multi-Variable Observatory (88 Indicators · `ES` · `EN` · `ខ្មែរ`)

- **New MoEYS `6–3–3–4` Mean Years of Schooling (`2008 · 2019`, `15+` & `25+`)** (`0, 3, 6, 9, 12, 16` years) + Higher/University Attainment (`educ_higher_15plus_pct`, `educ_higher_25plus_pct`).
- **Development-Focused Sanitation (`2008 · 2019`):** Public sewerage network connection (`toilet_sewer_pct`) and septic tank (`toilet_septic_pct`) separated from latrines.
- **Preah Sihanouk `avg_hh_size` 2019 Fix:** Uses regular-household population (`C8_HHTYPE = 1`) / regular households.
- **1998 NIS `+43k` Map Fix:** Verified `11,480,656` total across all 197 land districts.
- **Additional Indicators:** Housing tenure (`2008–2019`), disability (`2008–2019`), gendered unemployment & sectors, widowed/divorced, bought water, `IMR`/`CMR`/`ELIFE`/`TFR` (`1998`), and `crude_death_rate_2019` (`2019`).
- **Trilingual Variable Dictionary (`EN` · `ES` · `ខ្មែរ`):** [`docs/VARIABLE_DICTIONARY_3WAVE_PANEL202.md`](docs/VARIABLE_DICTIONARY_3WAVE_PANEL202.md) · [`.csv`](docs/VARIABLE_DICTIONARY_3WAVE_PANEL202.csv).
- **Microdata Limitation Notice:** Wave gaps in `1998` and `2008` reflect pending institutional access to the `1998` and `2008` REDATAM microdata (see [`docs/METHODOLOGY.md`](docs/METHODOLOGY.md)).

---

## Repository Structure (41 files · 70.72 MB)

```text
CambodiaCensus/
├── index.html                                # Main trilingual interactive web observatory (panel202)
├── population_1998.png                       # Harmonized 202-unit static map (1998, common log scale)
├── population_2008.png                       # Harmonized 202-unit static map (2008, common log scale)
├── population_2019.png                       # Harmonized 202-unit static map (2019, common log scale)
├── assets/hero-cambodia.jpg                  # Editorial 3D Cambodia dataset hero banner
├── maps/                                     # Exploratory interactive HTML & static PNG maps (native geometries & 2019 communes/mortality)
├── data/
│   ├── harmonized_panel202/                  # 1998–2019 harmonized 202-district panel (long, wide) & ADM3->202 crosswalk
│   ├── census_1998/                          # Full 1998 aggregated tables (Provinces, Districts, Communes, Villages; 126–135 vars)
│   ├── census_2008/                          # Full 2008 aggregated tables (Provinces, Districts, Communes, Villages; 139–141 vars)
│   ├── census_2019/                          # 2019 NIS 100% REDATAM aggregated tables (Communes Pop/Sex, Mortality, Districts)
│   ├── native_districts/                     # Native-geometry district population tables (1998, 2008, 2019)
│   └── boundaries/                           # Quarcs Cambodia shapefile 202 (district.geojson, province.geojson)
└── docs/
    ├── METHODOLOGY.md                        # Full harmonization methodology, 1998 conflict-exclusion notes & exact sources
    └── VARIABLE_DICTIONARY.md                # Complete variable dictionary across all datasets
```

---

## Published Aggregated Datasets

| File | Temporal & Territorial Coverage | Rows | Columns | Size |
| :--- | :--- | ---: | ---: | ---: |
| [`data/census_1998/census_1998_communes.csv`](data/census_1998/census_1998_communes.csv) | 1998 · 1,609 communes (ADM3) | `1,609` | `126` | 856.3 KB |
| [`data/census_1998/census_1998_districts.csv`](data/census_1998/census_1998_districts.csv) | 1998 · 184 district polygons / 183 unique (ADM2) | `184` | `126` | 104.7 KB |
| [`data/census_1998/census_1998_provinces.csv`](data/census_1998/census_1998_provinces.csv) | 1998 · 25 provinces (ADM1) | `25` | `126` | 15.6 KB |
| [`data/census_1998/census_1998_villages.csv`](data/census_1998/census_1998_villages.csv) | 1998 · 12,702 villages (ADM4) | `12,702` | `135` | 5166.4 KB |
| [`data/census_2008/commune_2008.csv`](data/census_2008/commune_2008.csv) | 2008 · 1,621 communes (ADM3) | `1,621` | `141` | 922.7 KB |
| [`data/census_2008/district_2008.csv`](data/census_2008/district_2008.csv) | 2008 · 193 districts (ADM2) | `193` | `140` | 126.1 KB |
| [`data/census_2008/province_2008.csv`](data/census_2008/province_2008.csv) | 2008 · 24 provinces (ADM1) | `24` | `140` | 18.7 KB |
| [`data/census_2008/village_2008.csv`](data/census_2008/village_2008.csv) | 2008 · 14,073 villages (ADM4) | `14,073` | `139` | 7084.5 KB |
| [`data/census_2019/commune_mortality_2019.csv`](data/census_2019/commune_mortality_2019.csv) | 2019 · 1,633 commune polygons (ADM3, crude mortality) | `1,633` | `20` | 346.6 KB |
| [`data/census_2019/commune_sex_pop_2019.csv`](data/census_2019/commune_sex_pop_2019.csv) | 2019 · 1,633 commune polygons (ADM3, pop & sex) | `1,633` | `19` | 306.4 KB |
| [`data/census_2019/district_population_2019.csv`](data/census_2019/district_population_2019.csv) | 2019 · 197 native districts (ADM2) | `197` | `10` | 14.0 KB |
| [`data/census_2019/unmatched_codes_audit_2019.csv`](data/census_2019/unmatched_codes_audit_2019.csv) | 2019 · ADM3 code audit | `33` | `12` | 2.6 KB |
| [`data/harmonized_panel202/crosswalk_communes_to_quarcs202_discrete.csv`](data/harmonized_panel202/crosswalk_communes_to_quarcs202_discrete.csv) | 1998–2019 · ADM3/ADM2 → 202 area weights | `11,972` | `8` | 1307.8 KB |
| [`data/harmonized_panel202/population_panel_1998_2019_long.csv`](data/harmonized_panel202/population_panel_1998_2019_long.csv) | 1998, 2008, 2019 · 202 harmonized units (long) | `606` | `8` | 38.5 KB |
| [`data/harmonized_panel202/population_panel_1998_2019_wide.csv`](data/harmonized_panel202/population_panel_1998_2019_wide.csv) | 1998, 2008, 2019 · 202 harmonized units (wide) | `202` | `14` | 20.2 KB |
| [`data/native_districts/district_population_1998.csv`](data/native_districts/district_population_1998.csv) | 1998 · 184 native district polygons (+NIS estimates) | `184` | `14` | 21.2 KB |
| [`data/native_districts/district_population_2008.csv`](data/native_districts/district_population_2008.csv) | 2008 · 193 native districts (ADM2) | `193` | `10` | 14.9 KB |
| [`data/native_districts/district_population_2019.csv`](data/native_districts/district_population_2019.csv) | 2019 · 197 native districts (ADM2) | `197` | `10` | 14.0 KB |

### Open Boundaries (GeoJSON, WGS84)
- [`data/boundaries/district.geojson`](data/boundaries/district.geojson) — **202 units** (`Quarcs Cambodia shapefile 202`, `geo_id`, `name`)
- [`data/boundaries/province.geojson`](data/boundaries/province.geojson) — **25 provinces** (`geo_id`, `name`)

---

## Key Methodological Highlights

- **Exact National Population Conservation (ADM3 → 202 units, `EPSG:32648`):**
  - **1998 Enumerated:** `11,437,656` (`97.20%` of communes fall `≥90%` within a single target district).
  - **1998 NIS-Adjusted:** `11,480,656` (includes official NIS estimates `+43,000` for Anlong Veaeng `10,000`, Samlout `23,000`, and Veal Veng `10,000`, which were not enumerated in March 1998 due to armed conflict).
  - **2008:** `13,395,682` (`99.63%` of communes fall `≥90%` within a single target district).
  - **2019:** `15,551,637` territorial inhabitants mapped (`+ 574` in non-territorial institutional code `269999` = `15,552,211`).
- **Observed vs. Estimated vs. Missing:** The harmonized panel explicitly separates observed/enumerated figures (`NA` for 1998 conflict-excluded areas) from NIS-adjusted estimates (`has_1998_nis_estimate = True`). See [`docs/METHODOLOGY.md`](docs/METHODOLOGY.md) and [`docs/VARIABLE_DICTIONARY.md`](docs/VARIABLE_DICTIONARY.md).

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

> Leiva, F. (2026). *CambodiaCensus: Open Subnational Population Observatory and Harmonized 202-District Census Repository (1998–2019)*. Powered by Gemini 4 Neon via Antigravity. https://github.com/Favioleiva/CambodiaCensus
