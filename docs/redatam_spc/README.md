# Reproducible REDATAM 7 `.spc` Command Scripts (Cambodia 2019 100% Census)

These REDATAM 7 `.spc` scripts reproduce the commune-level (`COMMUNE`, 6-digit `code_6`) aggregations used in **Geo4Cambodia / CambodiaCensus v4** directly inside **REDATAM 7** (`Camb.dic` / `Camb.dcf`).

> **Why Python streaming was used in the automated pipeline:** Our reproducible pipeline (`Scripts/Contract_10/01_build_v4_panel_and_spc.py`) streams the fixed-width CSPro `.dat` file using the exact byte offsets of `Camb.dcf` to produce identical commune-level integer counts in ~55 seconds. These `.spc` scripts are provided so researchers working in the REDATAM 7 GUI/Process environment can replicate every indicator directly.
>
> **Note on 1998 & 2008:** Equivalent `.spc` scripts cannot yet be run for 1998 and 2008 because institutional access to the 1998 and 2008 REDATAM microdata is still pending; those waves are currently derived from ODC's public aggregated commune CSVs.
