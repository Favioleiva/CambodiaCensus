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

2. **Discrete 1-to-1 Majority-Area Crosswalk (No Commune Splitting):** For each source commune $c$, metric intersection areas $A_{c,d} = \text{Area}(c \cap d)$ are computed across the 197 inhabited land districts in `EPSG:32648`, and the commune is assigned **100% (`weight = 1.0`, no splitting)** to the single district $d^* = \arg\max_d A_{c,d}$. This guarantees **exact integer national population conservation** and leaves the 5 `Tonlé Sap` lake sectors cleanly as `NA` (water body).

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



---



## v4 Methodological Audit & Microdata-Access Limitations (Contract 10)



1. **Mean Years of Schooling (`2008 · 2019`, MoEYS `6–3–3–4`):** Computed for both population `15+` and `25+` using Cambodia's official school cycle durations: `0` yrs (none / never attended / `P16C=88`), `3` yrs (primary incomplete, grades 1–5 midpoint), `6` yrs (primary completed, grade 6), `9` yrs (lower secondary, grades 7–9), `12` yrs (upper secondary, grades 10–12), and `16` yrs (higher/university education).

2. **Development-Focused Sanitation (`2008 · 2019`):** Broad "any toilet" was replaced by **public sewerage network connection (`toilet_sewer_pct`)** and **septic tank (`toilet_septic_pct`)** separately so pit latrines are never equated to public sewerage infrastructure.

3. **Average Household Size (`2019`):** Computed strictly as `pop_in_regular_hh / households_regular` (`C8_HHTYPE = 1`), removing collective/institutional dormitory distortion (notably in Preah Sihanouk / Koh Rong).

4. **2019 Direct CSPro/REDATAM Streaming Pipeline:** All 2019 commune-level counts were computed in Python by streaming `DataCleanFinalV3_100%_sortedCSPro_NoAbsRes.dat` (`19,147,696` records) using exact byte offsets from `Camb.dcf` and reconciled exactly to `15,552,211` inhabitants and `3,553,021` regular households.

5. **Pending Microdata Access (`1998` & `2008`):** Wave gaps and aggregation constraints in `1998` and `2008` (absence of sewerage disaggregation in 1998, grouped/incomplete 1998 education tables, absence of mortality in 2008, and lack of regular-household-only population denominators in 1998/2008) are **limitations resulting from not yet having institutional access to the 1998 and 2008 REDATAM microdata**, which is currently being requested.


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
One permanent footnote gives both the 1992 and 1998 counts in every year.
The legend reserves the same space across all four years so switching year
does not resize or reposition the map within its card. Only the historical
overlay changes with the year, not this footnote.
The Clear selection button removes the selected district and focus outline
without changing year, indicator or zoom. Its empty state retains the reference
statistics and reference time series; map, search and rankings can select again.

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
