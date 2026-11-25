# Methodology & Data Provenance — CambodiaCensus (1998–2019)

**Author:** Favio Leiva  
**Powered by:** Gemini 4 Neon via Antigravity  
**Governance:** Contractual Agentic AI (`AGENTS.md`)

---

## 1. Exact Data & Map Sources

| Dataset / Geometry | Exact Source | Format | Redistribution |
| :--- | :--- | :--- | :--- |
| **1998 Population Census (Provinces, Districts, Communes, Villages)** | [Open Development Cambodia — Census 1998](https://data.opendevelopmentcambodia.net/dataset/census-1998) | Aggregated CSVs & Shapefiles (UTM 48N) | Public aggregated tables |
| **2008 Population Census (Provinces, Districts, Communes, Villages)** | [Open Development Cambodia — Census 2008](https://data.opendevelopmentcambodia.net/en/dataset/census-2008) | Aggregated CSVs & Shapefiles (UTM 48N) | Public aggregated tables |
| **2019 Population Census (100% REDATAM Communes, Mortality, ADM2/ADM3 Shapefiles)** | [National Institute of Statistics (NIS Cambodia)](https://nis.gov.kh/en/statistical-table/) | Aggregated tables extracted from 100% REDATAM | Public aggregated tables (individual microdata excluded) |
| **Harmonized Reference Geometry (`Quarcs Cambodia shapefile 202`)** | [QuaRCS Lab / GDO-Cambodia (`quarcs-lab/geo4cambodia`)](https://github.com/quarcs-lab/geo4cambodia) | GeoJSON (`district.geojson` 202 units, `province.geojson` 25 units) | Open MIT / public academic geometry |

---

## 2. Harmonization Methodology (`ADM3` → `Quarcs Cambodia shapefile 202`)

Administrative boundaries in Cambodia evolved significantly between 1998 (183 unique districts / 184 polygons), 2008 (193 districts), 2019 (197 territorial districts), and the standardized **202-unit `Quarcs Cambodia shapefile 202`** (GADM 4.1 backbone, including the 2013 creation of Tboung Khmum province and urban splits in Phnom Penh).

To avoid coarse district-to-district interpolation, all three censuses are harmonized **from commune level (ADM3)**:

1. **Metric Projection (`EPSG:32648`):** Native commune polygons from 1998 (`1,609` rows / `1,607` dissolved codes), 2008 (`1,621` communes), and 2019 (`1,616` dissolved ADM3 codes from `khm_adm3_un.shp`) are projected to WGS84 / UTM Zone 48N (`EPSG:32648`) alongside `district.geojson` (202 units).
2. **Exact Area-Weighted Crosswalk:** For each source commune $c$ and target district $d$, intersection area $A_{c,d} = \text{Area}(c \cap d)$ is computed in square meters and normalized so $\sum_d w_{c,d} = 1.0$, guaranteeing **100% conservation of national territorial population**.
   - **1998:** `97.20%` of communes fall `≥90%` inside a single target district (`99.97%` mean raw overlap).
   - **2008:** `99.63%` of communes fall `≥90%` inside a single target district (`99.98%` mean raw overlap).
   - **2019 (ADM3):** `99.07%` of communes fall `≥90%` inside a single target district (`99.88%` mean raw overlap).
   - **2019 (ADM2 Fallback for 31 territorial communes):** The 31 territorial 2019 communes absent from `khm_adm3_un.shp` are allocated via their 4-digit parent district polygons (`khm_admbnda_adm2_gov_20181004.shp`), where `100.00%` fall `≥90%` inside a single target district.
3. **Exact National Population Conservation:**
   - **1998 (Enumerated):** `11,437,656` (source) = `11,437,656` (harmonized; diff = `0`).
   - **1998 (NIS-Adjusted):** `11,480,656` (`11,437,656 + 43,000`; diff = `0`).
   - **2008:** `13,395,682` (source) = `13,395,682` (harmonized; diff = `0`).
   - **2019 (Territorial):** `15,551,637` (source) = `15,551,637` (harmonized; diff = `0`), plus `574` inhabitants in non-territorial institutional code `269999` = `15,552,211` national total.

---

## 3. Census-Specific Notes & Data Integrity Distinctions

### 3.1. Why Three Districts Report Zero Population in 1998 (Observed vs. Estimated vs. Missing)
During Cambodia's General Population Census of **March 1998**, three border districts were inaccessible to enumerators due to ongoing military operations associated with the final stages of the Khmer Rouge insurgency:

| District (`code_4`) | Province | Recorded (Observed) | Harmonized Enumerated Panel | Official NIS Estimate |
| :--- | :--- | ---: | :--- | ---: |
| **Anlong Veaeng** (`2201`) | Oddar Meanchey | `0` | `NA` (missing due to conflict) | `10,000` |
| **Samlout** (`0209`) | Battambang | `0` | `NA` (missing due to conflict) | `23,000` |
| **Veal Veng** (`1506`) | Pursat | `0` | `NA` (missing due to conflict) | `10,000` |
| **Total** | | **`0`** | **`NA`** | **`43,000`** |

An additional ~`2,000` people were estimated in an excluded village of Ou Chrov district (`~45,000` total non-enumerated nationwide).

**Scientific rule implemented in `panel202`:**
- Zero values recorded in the raw 1998 database are **NOT** uninhabited districts—they are **missing census observations due to armed conflict**.
- In `population_panel_1998_2019_wide.csv` and `long.csv`, we explicitly distinguish:
  1. **Observed / Enumerated (`pop_1998_enumerated`):** classifies unenumerated conflict areas as `NA` (sum = `11,437,656`).
  2. **Official NIS-Adjusted (`pop_1998_nis_adjusted`):** incorporates the official NIS estimates (`+43,000`, sum = `11,480,656`), flagged by `has_1998_nis_estimate = True` and `nis_1998_estimate_added`, so researchers can run sensitivity and robustness checks transparently.

**Historical documentation references (used solely for this 1998 conflict-exclusion note; maps are not sourced from IPUMS):**
- NIS Cambodia — [General Population Census of Cambodia 1998: Final Results (PDF)](https://nis.gov.kh/wp-content/uploads/2025/09/General-Population-Census1998.pdf)
- NIS Cambodia — [General Population Census of Cambodia 2008: National Report (PDF)](https://nis.gov.kh/nis/census2008/GPC2008_Report_ENG.pdf)
- IPUMS International — [Cambodia 1998 District-Level Geographic Documentation (`GEO2_KH1998`)](https://international.ipums.org/international-action/variables/GEO2_KH1998)

### 3.2. Duplicate Codes in Raw 1998 Tables
- In `census_1998_districts.csv` / `district.shp`, code `1803` (*Stueng Hav*) appears as 2 separate polygon records (mainland + island) with identical `TOTPOP = 13,108`; deduplicating on `code_4` yields the exact official NIS total (`11,437,656`).
- In `census_1998_communes.csv`, 2 pairs of distinct communes share a `COMM_CODE`; summing by `code_6` before crosswalk allocation preserves the exact official national total (`11,437,656`).

### 3.3. Tonlé Sap Lake Sectors in `Quarcs Cambodia shapefile 202`
The 202-unit GADM 4.1 geometry (`district.geojson`) contains 197 inhabited land districts plus 5 water-body polygons named `Tonlé Sap` (`KH-02-15`, `KH-04-08`, `KH-06-09`, `KH-17-06`, `KH-21-12`). All 202 units are retained for strict compatibility with `quarcs-lab/geo4cambodia`; the interactive **Top 10 / Bottom 10** rankings and choropleth color scale lower bound (`3,500`) focus on the 197 inhabited land districts.
