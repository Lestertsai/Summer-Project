CHAO-YI TSAI, NATIONAL TAIPEI UNIVERSITY

# Student Project

**Title** : Development of a Cluster Analysis Algorithm to Analyze DNA High Resolution Melting (HRM) Profiles

**Student** : Chao-Yi, Tsai

**Advisor** : Prof. Lan-Szu Chou

**Research Background**

Rapid identification of unwanted microorganisms, especially pathogenic bacteria and viruses, is very important worldwide not only in food industries, but also in clinics. Traditional methods used to detect microorganisms such as bacteria include culturing based technologies via use of selective growth medium, biochemical tests, and serum typing. However, these methods are laborious and often take days to obtain results. In addition to traditional approaches, other technical and scientific challenges of achieving rapid detection of microorganisms include: (a) presence of mixed strains simultaneously, (b) lack of positive controls or a complete database for direct confirmation of sequencing results, and (c) requirement of expensive high-end analyzers/detectors for accurate identifications. To resolve the above technical issues, in this pilot study, we used a relative new approach, dual-confirmed high-resolution melting (DC-HRM) technique to analyze varied bacteria genomic DNA, and collected and deposited all data points during melting processes. The collected data points were treated as a small database. Noted that the characteristic of DC-HRM is easy to perform, no high-end instrument required, and through monitoring high-resolution melts from both probe-amplicon complex and amplicon-amplicon complex simultaneously in a single melting spectrum to achieve dual-confirmation. However, due to the lack of a proper analytical program to analyze DC-HRM profiles, an analysis based algorithm was developed using R software package. In results, via the combination of DC-HRM technique, a small HRM profile database, and a self-developed analytical algorithm, we demonstrated the potential of bacteria rapid detection using 40 type strains. More importantly, the collected HRM profiles may serve as an artificial positive control pools for future automated sequence matching analysis.

**The layout of this program**

Below is the window after executing the codes. It consists of three types of functions, which are calculation, scatter plot, and exist, respectively. To input data, please press the button of &quot;File&quot;. To view the input data, please press the button of &quot;Show Data&quot;.

![Window](https://github.com/Lestertsai/Summer-project/blob/main/image1.png) ![](https://github.com/Lestertsai/Summer-project/blob/main/image2.png)

Figure 1 Layout of the window

![](https://github.com/Lestertsai/Summer-project/blob/main/image3.png)

Figure 2 Layout of the data

**Predicting the unknown species**

To do so, please click the button of &quot;Calculation&quot;. Then, the unknown germ type would appear based on the calculation.

![](https://github.com/Lestertsai/Summer-project/blob/main/image4.png)

Figure 3 Identification of the species

**The notion of predicting species**

Since the same germ type would have the same response under a specific temperature, the distance of responses under all the temperatures between the known germs and the unknown one were calculated to represent the difference between germs. To illustrate, let _T_ represents the temperature, then

where a denotes a known species, b denotes the unknown one, and n is the total number of temperatures. Thus, the name of the unknown species is the germ that has the smallest distance with it.

**The distribution of responses under different temperatures for species**

To do so, please click the button of &quot;Scatter Plot&quot;. The newly pop-up window would outline all the germ types in the dataset, along with a joint plot option to display the distribution of two and more species. For instance, below is the scatter plot of L.d.bulgaricus.

![](https://github.com/Lestertsai/Summer-project/blob/main/image5.png)

Figure 4 Scatter plot
<p align="right">
  <img src="https://github.com/Lestertsai/Summer-project/blob/main/image7.png" />
</p>

To display multiple germs, press the button of &quot;Joint Plot&quot;, and the result would be as follows.

![](https://github.com/Lestertsai/Summer-project/blob/main/image6.png)

Figure 5 Scatter plot for multiple germs

**Appendix**

[**R code**](https://drive.google.com/file/d/1ezqpdnF5KqVKEWlPM2B30bkOH2hsfraB/view?usp=sharing) **,** [**Germ data**](https://drive.google.com/drive/folders/1FTLNaoR7zhtW6F_t6zY7ATYiaAzuVHMO?usp=sharing)

**References** :

1. Reja V., Kwok A., Stone G., Yang L., Missel A., Menzel C., Bassam B. 2010. ScreenClust: Advanced Statistical Software for Supervised and Unsupervised High Resolution Melting (HRM) Analysis. _Methods_ 50 (2010) S10–S14.
2. Kanderian S., Jiang L., Knight I. 2015. Automated Classification and Cluster Visualization of Genotypes Derived from High Resolution Melt Curves. _PLoS One_: 10(11):e0143295.
3. Velez D.O., Mack H., Jupe J., Hawker S., Kulkarni N., Hedayatnia B., Zhang Y., Lawrence S., Fraley S.I. 2017.
#
Massively Parallel Digital High Resolution Melt for Rapid and Absolutely Quantitative Sequence Profiling. _Sci Rep_.: 7:42326.
