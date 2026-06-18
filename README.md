<h1 align="center">
  🧬 Transcriptomics 🧬
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


**✍️Inleiding**
Reumatoïde artritis (RA) is een chronische auto-immuunziekte waarbij het immuunsysteem gezond gewrichtsweefsel aanvalt. Bij RA kan je ook last hebben van synovitis. Dit is een ontsteking van het gewrichtsslijmvlies (synovium), die kan leiden tot pijn, stijfheid en gewrichtsschade. De precieze oorzaak van RA is nog niet helemaal bekend. Wel zijn er verschillende factoren die invloed hebben zoals genetische aanleg en omgevingsfactoren. Met behulp van transcriptomics kan worden onderzocht welke genen actief zijn in gezond en ziek weefsel. Door genexpressiepatronen te vergelijken tussen patiënten met RA en gezonde controles kunnen genen en biologische processen worden geïdentificeerd die betrokken zijn bij het ziekteproces. Dit levert meer inzicht op in de moleculaire mechanismen achter RA en kan bijdragen aan de ontwikkeling van betere diagnostische methoden en behandelingen.

In dit project wordt een transcriptomicsanalyse uitgevoerd op RNA-sequencingdata van synoviumbiopten van vier patiënten met RA en vier gezonde controles. Met behulp van R worden differentieel tot expressie komende genen geïdentificeerd en wordt met een Gene Ontology-analyse onderzocht welke biologische pathways een rol spelen bij het ontstaan en de ontwikkeling van reumatoïde artritis.


---

**🧪Methoden**

**Dataset**

Voor dit onderzoek zijn RNA-sequencing data gebruikt afkomstig van synoviumbiopten. De dataset bestaat uit 8 samples, waarvan 4 afkomstig zijn van personen zonder Reumatoïde Artritis (controle) en 4 van personen met gevestigde RA (>12 maanden diagnose). De RA-patiënten zijn ACPA-positief getest, terwijl de controlegroep ACPA-negatief is. De data zijn afkomstig uit eerder uitgevoerd onderzoek [Platzer et al. (2019)](./Bronnen/Platzer%20et%20al.,%202019.pdf)

<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/ed966d2b-4611-4245-9f8a-6f4f55a9eceb" />

  <em> Workflow van de transcriptomics-analyse van synoviumbiopten van RA-patiënten en controles.</em>
</p>

---

**📊Resultaten**
---

Transcriptoomanalyse van synoviumbiopten van RA-patiënten en controles identificeerde meerdere differentieel geëxpresseerde genen. KEGG pathway-analyse liet zien dat vooral ontstekingsgerelateerde pathways verrijkt waren, waaronder de TNF-, NF-κB-, MAPK-, IL-17- en NOD-like receptor signaling pathways [Figuur 4](./Resultaten/Figuur%204.%20Barplot%20Kegg%20result.png) . Visualisatie van de TNF-signaleringsroute toonde verhoogde expressie van diverse genen betrokken bij ontsteking en immuunactivatie bij RA-patiënten [Figuur 8](./Resultaten/Figuur%208.%20Differenti%C3%ABle%20genexpressie%20in%20de%20TNF%20signaling%20pathway.png), vergeleken met de standaard KEGG-route [Figuur 7](./Resultaten/Figuur%207.%20Referentie-standaard%20TNF-signal%20pathway(KEGG).png). Daarnaast werden verhoogde expressieniveaus gevonden van cytokinen, chemokinen en transcriptiefactoren die een rol spelen bij synoviale ontsteking en gewrichtsschade. Deze resultaten ondersteunen de centrale rol van ontstekingsprocessen bij reumatoïde artritis.


**✅Conclusie**
---
