<h1 align="center">
  💗 Transcriptomics 💗
</h1>

<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/3693eb18-52cd-45f9-b115-4d4fa58cfdd2" />

- `data/ruw/` –  Bevat de ruwe sequencing datasets die als input dienen voor de analyse

- `data/processed` - Bevat verwerkte datasets die zijn gegenereerd met behulp van scripts

- `scripts/` – R -scripts voor data-analyse, verwerking en visualisatie

- `resultaten/` - Output van de analyse, zoals grafieken, tabellen en figuren

- `bronnen/` - Referenties en literatuur gebruikt binnen het project

- `README.md` - Overzicht en uitleg van het project, inclusief doel, methode en resultaten

- `data_stewardship/` - Voor de competentie beheren. 


---


**💗Inleiding**

Reumatoïde artritis (RA) is een chronische auto-immuunziekte waarbij het immuunsysteem gezond gewrichtsweefsel aanvalt. Bij RA kan je ook last hebben van synovitis. Dit is een ontsteking van het gewrichtsslijmvlies (synovium), die kan leiden tot pijn, stijfheid en gewrichtsschade. De precieze oorzaak van RA is nog niet helemaal bekend. Wel zijn er verschillende factoren die invloed hebben zoals genetische aanleg en omgevingsfactoren. Met behulp van transcriptomics kan worden onderzocht welke genen actief zijn in gezond en ziek weefsel.[Wang et al., 2022](Bronnen/Wang%20et%20al.,%202022.pdf) Door genexpressiepatronen te vergelijken tussen patiënten met RA en gezonde controles kunnen genen en biologische processen worden geïdentificeerd die betrokken zijn bij het ziekteproces. Dit levert meer inzicht op in de moleculaire mechanismen achter RA en kan bijdragen aan de ontwikkeling van betere diagnostische methoden en behandelingen. [Dessein et al., 2022](Bronnen/Dessein%20et%20al.,%202022.pdf)

In dit project wordt een transcriptomicsanalyse uitgevoerd op RNA-sequencingdata van synoviumbiopten van vier patiënten met RA en vier gezonde controles. Met behulp van R worden differentieel tot expressie komende genen geïdentificeerd en wordt met een Gene Ontology-analyse onderzocht welke biologische pathways een rol spelen bij het ontstaan en de ontwikkeling van reumatoïde artritis.[Platzer et al., 2019](Bronnen/Platzer%20et%20al.,%202019.pdf)

Onderzoeksvraag moet nog!!


---

**💗Methoden**

**Dataset**

Voor dit onderzoek zijn RNA-sequencing data gebruikt afkomstig van synoviumbiopten. De dataset bestaat uit 8 samples, waarvan 4 afkomstig zijn van personen zonder Reumatoïde Artritis als controlegroep en 4 van personen met RA (>12 maanden diagnose). De RA-patiënten zijn ACPA-positief getest, terwijl de controlegroep ACPA-negatief is. De data zijn afkomstig uit eerder uitgevoerd onderzoek [Platzer et al. (2019)](./Bronnen/Platzer%20et%20al.,%202019.pdf) De ruwe sequencingdata zijn opgeslagen in de map data/ruw/ van deze GitHub-repository.

De RNA-sequencingdata zijn verkregen met RNA-sequencing (RNA-seq), een techniek waarmee de hoeveelheid RNA-transcripten in een sample wordt bepaald. De gegenereerde reads zijn gemapt op het humane referentiegenoom, waardoor de reads aan de juiste genen konden worden toegewezen. Op basis hiervan is een genexpressiematrix opgesteld die als input diende voor de verdere analyses. De genexpressiematrix is geanalyseerd in R. Eerst zijn de data gecontroleerd en genormaliseerd om technische variatie tussen de samples te verminderen. Vervolgens is een differentiële genexpressie-analyse uitgevoerd om genen te identificeren die significant verschillen in expressie tussen de RA-groep en de controlegroep. De resultaten zijn weergegeven met onder andere een volcano plot en een heatmap?

Om de biologische betekenis van de gevonden differentieel geëxpresseerde genen te onderzoeken, zijn een Gene Ontology (GO)-analyse en een KEGG pathway-analyse uitgevoerd. De GO-analyse identificeert verrijkte biologische processen, moleculaire functies en cellulaire componenten. De KEGG pathway-analyse brengt metabole en signaaltransductieroutes in kaart die mogelijk betrokken zijn bij het ontstaan en de ontwikkeling van RA.

Alle analyses zijn uitgevoerd met R. De gebruikte scripts zijn te vinden in de map scripts/. De resultaten in resultaten/ en de gebruikte data in data/

<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/ed966d2b-4611-4245-9f8a-6f4f55a9eceb" />

  <em> Workflow van de transcriptomics-analyse van synoviumbiopten van RA-patiënten en controles.</em>
</p>

---

**💗Resultaten**
---

Transcriptomische analyse van synoviumbiopten van vier RA-patiënten en vier controles liet verschillen in genexpressie zien binnen de KEGG-pathway voor reumatoïde artritis ([Figuur 9](Resultaten/Figuur%209.%20KEGG-pathway%20van%20Reumato%C3%AFde%20Artritis%20(RA).png)). Meerdere ontstekingsgerelateerde genen, waaronder **IL1A**, **IL1B**, **CD28** en **MMP13**, waren verhoogd tot expressie gebracht bij RA, terwijl andere genen een verlaagde expressie vertoonden. Deze resultaten wijzen op activatie van immuun- en ontstekingsprocessen die bijdragen aan synovitis, gewrichtsschade en botafbraak, kenmerkende eigenschappen van reumatoïde artritis. De referentiepathway is weergegeven in [Figuur 10](Resultaten/Figuur%2010.%20Referentie%20KEGG-pathway%20van%20Reumato%C3%AFde%20Artritis..png).


**💗Conclusie**
---
