<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib uri="/bbUI" prefix="bbUI" %> 
 <%@ taglib uri="/bbData" prefix="bbData"%> 
 <%@ taglib uri="/bbNG" prefix="bbNG"%>
 
 <bbNG:learningSystemPage 
	title="LAB 2"
	ctxId="ctx">

	<bbNG:pageHeader>
		<bbNG:breadcrumbBar environment="COURSE"
			navItem="course_plugin_manage" >
				<bbNG:breadcrumb title="Home" href="index.jsp?course_id=@X@course.id@X@&user_id=@X@user.pk_string@X@" />
			<bbNG:breadcrumb> Lab 1 </bbNG:breadcrumb>
		</bbNG:breadcrumbBar>
		<bbNG:pageTitleBar>
			Welcome to to Chem 109 Lab 1
		</bbNG:pageTitleBar>
	</bbNG:pageHeader>
    
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <title>Lab 3</title>
    <link rel="stylesheet" href="/css/styles.css">
    <style>
    div{
    border:1px solid black;
    padding: none;
    }
    p {
    padding-top: none;
    padding-right: 5px;
    padding-bottom: none;
    padding-left: 5px;
}
    </style>
	<script type="text/javascript" src="./tinymce/tinymce.min.js"></script>
	<script type="text/javascript">
	tinyMCE.init({
        selector: "div",
        toolbar: "subscript superscript",
        min_height: 20,
        min_width: 100,
        menubar: false,
        resize: false,
        statusbar: false,
        inline: true        
	});
	</script>
</head>
 
<body>
<!-- change method to post. get is used only test purpose -->
<form method="get" action="somepage">
<h1>Lab 3: Inorganic Nomenclature Worksheet</h1>
<h3>1. Inorganic Compounds</h3>
<p>Write the symbol and charge of the cation, the symbol and charge of the anion, <br>and the chemical formula for each of the following compounds.	</p>

<table border="1" width="50%">
<tr><th>Compound</th><th>Cation</th><th>Anion</th><th>Chemical Formula</th></tr>
<tr>
<td>lithium fluoride</td>
<td><div contenteditable="true" name="textBox1"></div></td>
<td><div contenteditable="true" name="textBox2"></div></td>
<td><div contenteditable="true" name="textBox3"></div></td>
</tr>
<tr>
<td>potassium oxide</td>
<td><div contenteditable="true" name="textBox4"></div></td>
<td><div contenteditable="true" name="textBox5"></div></td>
<td><div contenteditable="true" name="textBox6"></div></td>
</tr>
<tr>
<td>magnesium iodide</td>
<td><div contenteditable="true" name="textBox7"></div></td>
<td><div contenteditable="true" name="textBox8"></div></td>
<td><div contenteditable="true" name="textBox9"></div></td>
</tr>
<tr>
<td>calcium nitride</td>
<td><div contenteditable="true" name="textBox10"></div></td>
<td><div contenteditable="true" name="textBox11"></div></td>
<td><div contenteditable="true" name="textBox12"></div></td>
</tr>
<tr>
<td>barium sulfide</td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox14"></div></td>
<td><div contenteditable="true" name="textBox15"></div></td>
</tr>
<tr>
<td>aluminum oxide</td>
<td><div contenteditable="true" name="textBox16"></div></td>
<td><div contenteditable="true" name="textBox17"></div></td>
<td><div contenteditable="true" name="textBox18"></div></td>
</tr>
</table>
<br />

<h3>Transition metals</h3>
<table border="1" width="50%">
<tr><th>Compound</th><th>Cation</th><th>Anion</th><th>Chemical Formula</th></tr>
<tr>
<td>lead (IV) oxide</td>
<td><div contenteditable="true" name="textBox1"></div></td>
<td><div contenteditable="true" name="textBox2"></div></td>
<td><div contenteditable="true" name="textBox3"></div></td>
</tr>
<tr>
<td>chromium (III) oxide</td>
<td><div contenteditable="true" name="textBox4"></div></td>
<td><div contenteditable="true" name="textBox5"></div></td>
<td><div contenteditable="true" name="textBox6"></div></td>
</tr>
<tr>
<td>copper (I) chloride</td>
<td><div contenteditable="true" name="textBox7"></div></td>
<td><div contenteditable="true" name="textBox8"></div></td>
<td><div contenteditable="true" name="textBox9"></div></td>
</tr>
<tr>
<td>iron (II) sulfide</td>
<td><div contenteditable="true" name="textBox10"></div></td>
<td><div contenteditable="true" name="textBox11"></div></td>
<td><div contenteditable="true" name="textBox12"></div></td>
</tr>
<tr>
<td>silver iodide</td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox14"></div></td>
<td><div contenteditable="true" name="textBox15"></div></td>
</tr>
</table>
<br />

<h3>Polyatomics</h3>
<table border="1" width="50%">
<tr><th>Compound</th><th>Cation</th><th>Anion</th><th>Chemical Formula</th></tr>
<tr>
<td>Zinc sulfate</td>
<td><div contenteditable="true" name="textBox1"></div></td>
<td><div contenteditable="true" name="textBox2"></div></td>
<td><div contenteditable="true" name="textBox3"></div></td>
</tr>
<tr>
<td>Barium nitrite</td>
<td><div contenteditable="true" name="textBox4"></div></td>
<td><div contenteditable="true" name="textBox5"></div></td>
<td><div contenteditable="true" name="textBox6"></div></td>
</tr>
<tr>
<td>chromium (II) phosphate</td>
<td><div contenteditable="true" name="textBox7"></div></td>
<td><div contenteditable="true" name="textBox8"></div></td>
<td><div contenteditable="true" name="textBox9"></div></td>
</tr>
<tr>
<td>potassium permanganate</td>
<td><div contenteditable="true" name="textBox10"></div></td>
<td><div contenteditable="true" name="textBox11"></div></td>
<td><div contenteditable="true" name="textBox12"></div></td>
</tr>
<tr>
<td>Manganese (II) hydroxide</td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox14"></div></td>
<td><div contenteditable="true" name="textBox15"></div></td>
</tr>
<tr>
<td>calcium carbonate</td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox14"></div></td>
<td><div contenteditable="true" name="textBox15"></div></td>
</tr>
<tr>
<td>potassium hydrogen phosphate</td>
<td><div contenteditable="true" name="textBox7"></div></td>
<td><div contenteditable="true" name="textBox8"></div></td>
<td><div contenteditable="true" name="textBox9"></div></td>
</tr>
<tr>
<td>Ammonium sulfate</td>
<td><div contenteditable="true" name="textBox10"></div></td>
<td><div contenteditable="true" name="textBox11"></div></td>
<td><div contenteditable="true" name="textBox12"></div></td>
</tr>
</table>
<br />
<h3>Write the name of each of the following compounds</h3>
<table border="1" width="50%">
<tr>
<td width="50%">(NH<sub>4</sub>)<sub>2</sub>CO<sub>3</sub></td>
<td width="50%"><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>Zn(OH)<sub>2</sub></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>Co(NO<sub>3</sub>)<sub>3</sub></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>K<sub>2</sub>SO<sub>4</sub></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>Cr<sub>2</sub>O<sub>3</sub></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>K<sub>2</sub>SO<sub>3</sub></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>Pb(CH<sub>3</sub>COO)<sub>2</sub></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>K<sub>2</sub>S</td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>Na<sub>3</sub>P</td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>Na<sub>3</sub>PO<sub>4</sub></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>LiNO<sub>2</sub></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
</table>
<br />

<h3>2. Molecular Compounds</h3>
<table border="1" width="50%">
<tr>
<td width="50%">Carbon tetrachloride</td>
<td width="50%"><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>N<sub>2</sub>O<sub>4</sub></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>Ammonia</td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>Dinitrogen trioxide</td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>P<sub>2</sub>O<sub>5</sub></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>SF<SUB>6</SUB></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>Carbon disulfide</td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>NO</td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
</table>
<br />

<h3>3. Acids and Bases</h3>
<table border="1" width="50%">
<tr>
<td width="50%">Nitric acid</td>
<td width="50%"><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>Acetic acid</td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>Sulfuric acid</td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>Hydrobromic acid</td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>Carbonic acid</td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>Nitrous acid</td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>Phosphoric acid</td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>Sulfurous acid</td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
</table>
<br />

<table border="1" width="50%">
<tr>
<td width="30%">HCl</td>
<td width="40%"><div contenteditable="true" name="textBox13"></div></td>
<td width="30%"><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>H<sub>2</sub>SO<sub>4</sub></td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>NaOH</td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>CH<sub>3</sub>COOH</td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>H<sub>3</sub>PO<sub>4</sub></td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>Ba(OH)<sub>2</sub></td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>HCN</td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>HNO<sub>3</sub></td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
</table>
<br />

<h3>4. Mixed Review</h3>
<table border="1" width="50%">
<tr>
<td width="30%">Name</td>
<td width="40%">Category</div></td>
<td width="30%">Formula</div></td>
</tr>
<tr>
<td>Hydrochloric acid</td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>Sodium bicarbonate</td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>Aluminum chloride</td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>Lithium sulfite</td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>Dinitrogen monoxide</td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>Iron (III) hydroxide</td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>Magnesium nitrate</td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>Xenon tetrafluoride</td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>Hydrofluoric acid</td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>Nitrogen dioxide</td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>Phosphorous pentoxide</td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>Zinc dichromate</td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
</table>
<br />

<table border="1" width="50%">
<tr>
<td width="30%">Formula</td>
<td width="40%">Category</div></td>
<td width="30%">Name</div></td>
</tr>
<tr>
<td>(NH<sub>4</sub>)<sub>2</sub>CO<sub>3</sub></td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>Zn(OH)<sub>2</sub></td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>Co(NO<sub>3</sub>)<sub>3</sub></td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>NO<sub>3</sub></td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>PCl<sub>5</sub></td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>CrO</td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>N<sub>2</sub>O<sub>4</sub></td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
<tr>
<td>H<sub>2</sub>SO<sub>4</sub></td>
<td><div contenteditable="true" name="textBox13"></div></td>
<td><div contenteditable="true" name="textBox13"></div></td>
</tr>
</table>
<br />

<input type="hidden" name="secret" value="888" />
<input type="reset" value="Clear" />
<input type="submit" name="save_button" value="Save" />
<input type="submit" name="check_button" value="Check" />
<input type="submit" name="submit_button" value="Submit" /> 
</form>

</body>
</html>
</bbNG:learningSystemPage>