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

Voor dit onderzoek is gebruikgemaakt van RNA-sequencing (RNA-seq) data afkomstig van synoviumbiopten. De dataset bestaat uit acht samples: vier van controles zonder reumatoïde artritis (RA) en vier van RA-patiënten met een ziekteduur van minimaal 12 maanden. Alle patiënten waren ACPA-positief en de controles ACPA-negatief. De gebruikte data zijn afkomstig van [Platzer et al. (2019)](./Bronnen/Platzer%20et%20al.,%202019.pdf) 

De analyse is uitgevoerd in R. Eerst is het humane referentiegenoom GRCh38.p14 (GCF_000001405.40) geïndexeerd met behulp van het R-package Rsubread (v2.24.0). Vervolgens zijn paired-end reads uitgelijnd tegen dit referentiegenoom, waarna BAM-bestanden zijn gegenereerd voor alle samples.

Op basis van de alignments is met featureCounts een gen-level countmatrix opgesteld met een GTF-annotatiebestand. Deze matrix vormde de input voor downstream analyse in DESeq2 (v1.50.2). Na normalisatie is een differentiële expressieanalyse uitgevoerd om genen te identificeren met significante expressieveranderingen tussen RA- en controlegroepen (padj < 0.05, |log2FC| > 1).

Voor visualisatie is een volcano plot gegenereerd met EnhancedVolcano. Ook zijn significant differentieel tot expressie komende genen geselecteerd voor functionele verrijkingsanalyses. Gene Ontology (GO)-analyse is uitgevoerd met clusterProfiler, waarbij biologische processen, cellulaire componenten en moleculaire functies zijn onderzocht. KEGG pathway-analyse is gebruikt om verrijkte signaalroutes te identificeren. Visualisatie van pathways is uitgevoerd met pathview


<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/ed966d2b-4611-4245-9f8a-6f4f55a9eceb" />

  <em> Workflow van de transcriptomics-analyse van synoviumbiopten van RA-patiënten en controles.</em>
</p>

---

**💗Resultaten**
---

### 🔬 Vulcano plot
De volcano plot [Figuur 1](Resultaten/Figuur%201.%20Vulcano%20Plot.png) toont de resultaten van de differentiële genexpressieanalyse tussen RA-patiënten en controles. De x-as geeft de log₂ fold change weer en de y-as de negatieve log₁₀ van de aangepaste p-waarde. Genen die zowel een significante expressieverandering (padj < 0,05) als een absolute log₂ fold change groter dan 1 vertonen, zijn rood weergegeven. Positieve log₂ fold change-waarden duiden op hogere expressie in de RA-groep, terwijl negatieve waarden wijzen op lagere expressie ten opzichte van de controlegroep.

<img width="1833" height="791" alt="Vulcano Plot" src="https://github.com/user-attachments/assets/cdf04c7c-db35-4032-9e3d-5a88f7467582" />
<sub><b>Figuur 1.</b> Volcano plot van de differentiële genexpressieanalyse tussen de RA-groep en de controlegroep. Genen met een significante expressieverandering (padj < 0,05 en |log₂ fold change| > 1) zijn rood weergegeven.</sub>

---

### 🔬 GO- Analyse


De GO-analyse toonde een sterke verrijking van immuungerelateerde processen, waaronder lymfocytdifferentiatie, leukocyt-gemedieerde immuniteit, T-celdifferentiatie en B-celactivatie ([Figuur 2](./Resultaten/Figuur%202.%20GO-analyse.png)). Deze processen waren significant verrijkt onder de differentieel geëxpresseerde genen.
<img width="1918" height="990" alt="GO-analyse" src="https://github.com/user-attachments/assets/e063c510-8c18-4256-9e2c-3295852eb341" />
<sub>**Figuur 2.** GO-enrichmentanalyse van differentieel geëxpresseerde genen tussen RA-patiënten en controles. De meest verrijkte biologische processen zijn voornamelijk gerelateerd aan immuunresponsen, waaronder lymfocytdifferentiatie, leukocyt-gemedieerde immuniteit, T-celdifferentiatie en B-celactivatie. De grootte van de stippen geeft het aantal genen weer en de kleur de gecorrigeerde p-waarde .</sub>


---

### 🔬 Barplot en dotplot Kegg pathway-analyse
De barplot en dotplot van de KEGG pathway-analyse lieten zien dat verschillende ontstekings- en immuungerelateerde pathways significant verrijkt waren bij RA. De meest verrijkte pathways waren onder andere de MAPK, TNF, NF-kappa B, IL-17 en NOD-like receptor signaling pathways ([Figuur 3](./Resultaten/Figuur%203.%20Dotplot%20Kegg%20result.png) en [Figuur 4](./Resultaten/Figuur%204.%20Barplot%20Kegg%20result.png)).
<p align="center">
  <img src="https://github.com/user-attachments/assets/846db693-43b7-4cf1-809d-5fa5bc70716a" alt="Barplot KEGG result" width="350">
  <img src="https://github.com/user-attachments/assets/2e721ee1-5bb4-490a-8e47-9bfce5d7d6d8" alt="Dotplot KEGG result" width="350">
</p>
<p align="center">
  <b>Figuur 4:</b> Barplot van de KEGG pathway-analyse &nbsp;&nbsp;&nbsp;
  <b>Figuur 3:</b> Dotplot van de KEGG pathway-analyse
</p
  
<sub><b>Figuur 3 & 4.</b> Dotplot van de KEGG pathway-analyse van differentieel geëxpresseerde genen tussen RA-patiënten en controles. De grootte van de stippen geeft het aantal genen weer en de kleur de gecorrigeerde p-waarde.</sub>

---

### 🔬 Kegg-pathway
Transcriptomische analyse van synoviumbiopten van vier RA-patiënten en vier controles liet verschillen in genexpressie zien binnen de KEGG-pathway voor reumatoïde artritis ([Figuur 9](Resultaten/Figuur%209.%20KEGG-pathway%20van%20Reumato%C3%AFde%20Artritis%20(RA).png)). Meerdere ontstekingsgerelateerde genen, waaronder **IL1A**, **IL1B**, **CD28** en **MMP13**, waren verhoogd tot expressie gebracht bij RA, terwijl andere genen een verlaagde expressie vertoonden. Deze resultaten wijzen op activatie van immuun- en ontstekingsprocessen die bijdragen aan synovitis, gewrichtsschade en botafbraak, kenmerkende eigenschappen van reumatoïde artritis. De referentiepathway is weergegeven in [Figuur 10](Resultaten/Figuur%2010.%20Referentie%20KEGG-pathway%20van%20Reumato%C3%AFde%20Artritis..png).

<div align="center">

<table>
  <tr>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/44ddae3f-a4d9-4e0a-91ae-3adc5f77557b" alt="KEGG-pathway van Reumatoïde Artritis (RA)" width="450"><br>
      <b>Figuur 9.</b> KEGG-pathway van Reumatoïde Artritis (RA).
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/ec4206f9-92fa-49ca-9100-981361dee566" alt="Referentie KEGG-pathway van Reumatoïde Artritis" width="450"><br>
      <b>Figuur 10.</b> Referentie KEGG-pathway van Reumatoïde Artritis.
    </td>
  </tr>
</table>
</div>

<sub>Figuur 9 & 10. KEGG Rheumatoid Arthritis pathway. Figuur 10 toont de standaard pathway, terwijl Figuur 9 de differentiële genexpressie tussen RA-patiënten en controles weergeeft. Rood duidt op verhoogde expressie en groen op verlaagde expressie.</sub>

---


**💗Conclusie**
---

In dit onderzoek is met behulp van RNA-sequencing de genexpressie in synoviumbiopten van patiënten met reumatoïde artritis (RA) vergeleken met die van gezonde controles. De differentiële genexpressieanalyse liet zien dat meerdere genen significant verschillend tot expressie komen tussen beide groepen. Daarnaast toonden de Gene Ontology (GO)- en KEGG pathway-analyses aan dat deze genen betrokken zijn bij biologische processen en signaalroutes die samenhangen met ontsteking en immuunactivatie, wat aansluit bij de bekende pathogenese van RA.

De resultaten bevestigen dat transcriptomics een waardevolle methode is om moleculaire veranderingen bij RA in kaart te brengen en kunnen bijdragen aan een beter begrip van de ziekte. Dit sluit aan bij eerder onderzoek, waarin eveneens verstoringen in immuun- en ontstekingsgerelateerde pathways zijn beschreven bij RA-patiënten.

Een belangrijke beperking van dit onderzoek is de kleine steekproefomvang van acht samples. Hierdoor is de statistische betrouwbaarheid beperkt en kunnen de resultaten niet zonder meer worden gegeneraliseerd naar de gehele RA-populatie. Aanbevolen wordt om vervolgonderzoek uit te voeren met grotere en meer diverse patiëntengroepen. Daarnaast kan validatie van de gevonden genen met aanvullende technieken, zoals qPCR of eiwitexpressieanalyses, de betrouwbaarheid van de resultaten vergroten. Dergelijk vervolgonderzoek kan bijdragen aan de identificatie van nieuwe biomarkers en potentiële therapeutische aangrijpingspunten voor reumatoïde artritis.
