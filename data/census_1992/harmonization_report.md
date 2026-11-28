# Harmonization Report — Cambodia 1992 into Quarcs Shapefile (`Contract_04`)

## 1. Scope & Exact Mass Preservation
- **Variables harmonized (strictly 3):** `population`, `men` (`population - fem_pop`), `women` (`fem_pop`).
- **Target geometry:** `X:\Agentic Tasks\Cambodia Project\Inputs\geo4cambodia_mendez\` (`25` provinces, `202` districts; read-only).
- **Exact National Totals Preserved:** `population = 8,823,495` | `women = 4,680,638` | `men = 4,142,857` (`men + women == population` on 202/202 districts and 25/25 provinces).

## 2. Classification of the 202 Quarcs Districts
| Mapping Type | Districts | Explanation |
| :--- | ---: | :--- |
| `1_to_1_exact` | 157 | Documented in `crosswalk_1992_to_quarcs.csv` |
| `commune_exact_split` | 29 | Documented in `crosswalk_1992_to_quarcs.csv` |
| `not_covered_in_1992_untac` | 10 | Documented in `crosswalk_1992_to_quarcs.csv` |
| `sub_commune_parent_retained` | 1 | Documented in `crosswalk_1992_to_quarcs.csv` |
| `water_body` | 5 | Documented in `crosswalk_1992_to_quarcs.csv` |

## 3. Harmonized 1992 Population across the 25 Modern Quarcs Provinces
| `geo_id` | Province (Quarcs) | Population (1992) | Men (1992) | Women (1992) | Districts w/ Data / Total |
| :--- | :--- | ---: | ---: | ---: | :---: |
| `KH-01` | Banteay Meanchey | 368,704 | 179,807 | 188,897 | 8 / 9 |
| `KH-02` | Battambang | 533,582 | 247,577 | 286,005 | 10 / 15 |
| `KH-03` | Kampong Cham | 783,378 | 369,174 | 414,204 | 10 / 10 |
| `KH-04` | Kampong Chhnang | 304,008 | 139,295 | 164,713 | 8 / 9 |
| `KH-05` | Kampong Speu | 465,457 | 217,741 | 247,716 | 8 / 8 |
| `KH-06` | Kampong Thom | 469,712 | 210,988 | 258,724 | 8 / 9 |
| `KH-07` | Kampot | 443,638 | 207,332 | 236,306 | 8 / 8 |
| `KH-08` | Kandal | 841,614 | 393,783 | 447,831 | 11 / 11 |
| `KH-09` | Koh Kong | 64,834 | 31,226 | 33,608 | 7 / 7 |
| `KH-10` | Kep | 10,631 | 4,995 | 5,636 | 1 / 2 |
| `KH-11` | Kratie | 192,823 | 93,086 | 99,737 | 6 / 6 |
| `KH-12` | Pailin | 0 | 0 | 0 | 0 / 2 |
| `KH-13` | Preah Sihanouk | 111,860 | 54,047 | 57,813 | 4 / 4 |
| `KH-14` | Mondulkiri | 21,449 | 10,268 | 11,181 | 5 / 5 |
| `KH-15` | Oddar Meanchey | 43,184 | 20,908 | 22,276 | 3 / 5 |
| `KH-16` | Phnom Penh | 667,814 | 323,709 | 344,105 | 12 / 12 |
| `KH-17` | Pursat | 254,587 | 116,790 | 137,797 | 5 / 7 |
| `KH-18` | Preah Vihear | 86,460 | 34,732 | 51,728 | 8 / 8 |
| `KH-19` | Prey Veng | 881,463 | 416,042 | 465,421 | 13 / 13 |
| `KH-20` | Ratanakiri | 66,764 | 32,903 | 33,861 | 9 / 9 |
| `KH-21` | Siem Reap | 533,339 | 246,925 | 286,414 | 12 / 13 |
| `KH-22` | Stung Treng | 63,528 | 30,033 | 33,495 | 5 / 5 |
| `KH-23` | Svay Rieng | 416,058 | 197,532 | 218,526 | 8 / 8 |
| `KH-24` | Takeo | 636,404 | 294,014 | 342,390 | 10 / 10 |
| `KH-25` | Tbong Khmum | 562,204 | 269,950 | 292,254 | 7 / 7 |
