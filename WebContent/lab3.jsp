<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Labs.lab3Checks" %>
    
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
                    <td><div contenteditable="true" name="00"></div></td>
                    <td><div contenteditable="true" name="01"></div></td>
                    <td><div contenteditable="true" name="02"></div></td>
                </tr>
                <tr>
                    <td>potassium oxide</td>
                    <td><div contenteditable="true" name="10"></div></td>
                    <td><div contenteditable="true" name="11"></div></td>
                    <td><div contenteditable="true" name="12"></div></td>
                </tr>
                <tr>
                    <td>magnesium iodide</td>
                    <td><div contenteditable="true" name="20"></div></td>
                    <td><div contenteditable="true" name="21"></div></td>
                    <td><div contenteditable="true" name="22"></div></td>
                </tr>
                <tr>
                    <td>calcium nitride</td>
                    <td><div contenteditable="true" name="30"></div></td>
                    <td><div contenteditable="true" name="31"></div></td>
                    <td><div contenteditable="true" name="32"></div></td>
                </tr>
                <tr>
                    <td>barium sulfide</td>
                    <td><div contenteditable="true" name="40"></div></td>
                    <td><div contenteditable="true" name="41"></div></td>
                    <td><div contenteditable="true" name="42"></div></td>
                </tr>
                <tr>
                    <td>aluminum oxide</td>
                    <td><div contenteditable="true" name="50"></div></td>
                    <td><div contenteditable="true" name="51"></div></td>
                    <td><div contenteditable="true" name="52"></div></td>
                </tr>
            </table>
            <br />
            <h3>Transition metals</h3>
            <table border="1" width="50%">
                <tr><th>Compound</th><th>Cation</th><th>Anion</th><th>Chemical Formula</th></tr>
                <tr>
                    <td>lead (IV) oxide</td>
                    <td><div contenteditable="true" name="60"></div></td>
                    <td><div contenteditable="true" name="61"></div></td>
                    <td><div contenteditable="true" name="62"></div></td>
                </tr>
                <tr>
                    <td>chromium (III) oxide</td>
                    <td><div contenteditable="true" name="70"></div></td>
                    <td><div contenteditable="true" name="71"></div></td>
                    <td><div contenteditable="true" name="72"></div></td>
                </tr>
                <tr>
                    <td>copper (I) chloride</td>
                    <td><div contenteditable="true" name="80"></div></td>
                    <td><div contenteditable="true" name="81"></div></td>
                    <td><div contenteditable="true" name="82"></div></td>
                </tr>
                <tr>
                    <td>iron (II) sulfide</td>
                    <td><div contenteditable="true" name="90"></div></td>
                    <td><div contenteditable="true" name="91"></div></td>
                    <td><div contenteditable="true" name="92"></div></td>
                </tr>
                <tr>
                    <td>silver iodide</td>
                    <td><div contenteditable="true" name="100"></div></td>
                    <td><div contenteditable="true" name="101"></div></td>
                    <td><div contenteditable="true" name="102"></div></td>
                </tr>
            </table>
            <br />
            <h3>Polyatomics</h3>
            <table border="1" width="50%">
                <tr><th>Compound</th><th>Cation</th><th>Anion</th><th>Chemical Formula</th></tr>
                <tr>
                    <td>Zinc sulfate</td>
                    <td><div contenteditable="true" name="110"></div></td>
                    <td><div contenteditable="true" name="111"></div></td>
                    <td><div contenteditable="true" name="112"></div></td>
                </tr>
                <tr>
                    <td>Barium nitrite</td>
                    <td><div contenteditable="true" name="120"></div></td>
                    <td><div contenteditable="true" name="121"></div></td>
                    <td><div contenteditable="true" name="122"></div></td>
                </tr>
                <tr>
                    <td>chromium (II) phosphate</td>
                    <td><div contenteditable="true" name="130"></div></td>
                    <td><div contenteditable="true" name="131"></div></td>
                    <td><div contenteditable="true" name="132"></div></td>
                </tr>
                <tr>
                    <td>potassium permanganate</td>
                    <td><div contenteditable="true" name="140"></div></td>
                    <td><div contenteditable="true" name="141"></div></td>
                    <td><div contenteditable="true" name="142"></div></td>
                </tr>
                <tr>
                    <td>Manganese (II) hydroxide</td>
                    <td><div contenteditable="true" name="150"></div></td>
                    <td><div contenteditable="true" name="151"></div></td>
                    <td><div contenteditable="true" name="152"></div></td>
                </tr>
                <tr>
                    <td>calcium carbonate</td>
                    <td><div contenteditable="true" name="160"></div></td>
                    <td><div contenteditable="true" name="161"></div></td>
                    <td><div contenteditable="true" name="162"></div></td>
                </tr>
                <tr>
                    <td>potassium hydrogen phosphate</td>
                    <td><div contenteditable="true" name="170"></div></td>
                    <td><div contenteditable="true" name="171"></div></td>
                    <td><div contenteditable="true" name="172"></div></td>
                </tr>
                <tr>
                    <td>Ammonium sulfate</td>
                    <td><div contenteditable="true" name="180"></div></td>
                    <td><div contenteditable="true" name="181"></div></td>
                    <td><div contenteditable="true" name="182"></div></td>
                </tr>
            </table>
            <br />
            <h3>Write the name of each of the following compounds</h3>
            <table border="1" width="50%">
                <tr>
                    <td width="50%">(NH<sub>4</sub>)<sub>2</sub>CO<sub>3</sub></td>
                    <td width="50%"><div contenteditable="true" name="190"></div></td>
                </tr>
                <tr>
                    <td>Zn(OH)<sub>2</sub></td>
                    <td><div contenteditable="true" name="200"></div></td>
                </tr>
                <tr>
                    <td>Co(NO<sub>3</sub>)<sub>3</sub></td>
                    <td><div contenteditable="true" name="210"></div></td>
                </tr>
                <tr>
                    <td>K<sub>2</sub>SO<sub>4</sub></td>
                    <td><div contenteditable="true" name="220"></div></td>
                </tr>
                <tr>
                    <td>Cr<sub>2</sub>O<sub>3</sub></td>
                    <td><div contenteditable="true" name="230"></div></td>
                </tr>
                <tr>
                    <td>K<sub>2</sub>SO<sub>3</sub></td>
                    <td><div contenteditable="true" name="240"></div></td>
                </tr>
                <tr>
                    <td>Pb(CH<sub>3</sub>COO)<sub>2</sub></td>
                    <td><div contenteditable="true" name="250"></div></td>
                </tr>
                <tr>
                    <td>K<sub>2</sub>S</td>
                    <td><div contenteditable="true" name="260"></div></td>
                </tr>
                <tr>
                    <td>Na<sub>3</sub>P</td>
                    <td><div contenteditable="true" name="270"></div></td>
                </tr>
                <tr>
                    <td>Na<sub>3</sub>PO<sub>4</sub></td>
                    <td><div contenteditable="true" name="280"></div></td>
                </tr>
                <tr>
                    <td>LiNO<sub>2</sub></td>
                    <td><div contenteditable="true" name="290"></div></td>
                </tr>
            </table>
            <br />
            <h3>2. Molecular Compounds</h3>
            <table border="1" width="50%">
                <tr>
                    <td width="50%">Carbon tetrachloride</td>
                    <td width="50%"><div contenteditable="true" name="300"></div></td>
                </tr>
                <tr>
                    <td>N<sub>2</sub>O<sub>4</sub></td>
                    <td><div contenteditable="true" name="310"></div></td>
                </tr>
                <tr>
                    <td>Ammonia</td>
                    <td><div contenteditable="true" name="320"></div></td>
                </tr>
                <tr>
                    <td>Dinitrogen trioxide</td>
                    <td><div contenteditable="true" name="330"></div></td>
                </tr>
                <tr>
                    <td>P<sub>2</sub>O<sub>5</sub></td>
                    <td><div contenteditable="true" name="340"></div></td>
                </tr>
                <tr>
                    <td>SF<SUB>6</SUB></td>
                    <td><div contenteditable="true" name="350"></div></td>
                </tr>
                <tr>
                    <td>Carbon disulfide</td>
                    <td><div contenteditable="true" name="360"></div></td>
                </tr>
                <tr>
                    <td>NO</td>
                    <td><div contenteditable="true" name="370"></div></td>
                </tr>
            </table>
            <br />
            <h3>3. Acids and Bases</h3>
            <table border="1" width="50%">
                <tr>
                    <td width="50%">Nitric acid</td>
                    <td width="50%"><div contenteditable="true" name="380"></div></td>
                </tr>
                <tr>
                    <td>Acetic acid</td>
                    <td><div contenteditable="true" name="390"></div></td>
                </tr>
                <tr>
                    <td>Sulfuric acid</td>
                    <td><div contenteditable="true" name="400"></div></td>
                </tr>
                <tr>
                    <td>Hydrobromic acid</td>
                    <td><div contenteditable="true" name="410"></div></td>
                </tr>
                <tr>
                    <td>Carbonic acid</td>
                    <td><div contenteditable="true" name="420"></div></td>
                </tr>
                <tr>
                    <td>Nitrous acid</td>
                    <td><div contenteditable="true" name="430"></div></td>
                </tr>
                <tr>
                    <td>Phosphoric acid</td>
                    <td><div contenteditable="true" name="440"></div></td>
                </tr>
                <tr>
                    <td>Sulfurous acid</td>
                    <td><div contenteditable="true" name="450"></div></td>
                </tr>
            </table>
            <br />
            <table border="1" width="50%">
                <tr>
                    <td width="30%">HCl</td>
                    <td width="40%"><div contenteditable="true" name="460"></div></td>
                    <td width="30%"><div contenteditable="true" name="461"></div></td>
                </tr>
                <tr>
                    <td>H<sub>2</sub>SO<sub>4</sub></td>
                    <td><div contenteditable="true" name="470"></div></td>
                    <td><div contenteditable="true" name="471"></div></td>
                </tr>
                <tr>
                    <td>NaOH</td>
                    <td><div contenteditable="true" name="480"></div></td>
                    <td><div contenteditable="true" name="481"></div></td>
                </tr>
                <tr>
                    <td>CH<sub>3</sub>COOH</td>
                    <td><div contenteditable="true" name="490"></div></td>
                    <td><div contenteditable="true" name="491"></div></td>
                </tr>
                <tr>
                    <td>H<sub>3</sub>PO<sub>4</sub></td>
                    <td><div contenteditable="true" name="500"></div></td>
                    <td><div contenteditable="true" name="501"></div></td>
                </tr>
                <tr>
                    <td>Ba(OH)<sub>2</sub></td>
                    <td><div contenteditable="true" name="510"></div></td>
                    <td><div contenteditable="true" name="511"></div></td>
                </tr>
                <tr>
                    <td>HCN</td>
                    <td><div contenteditable="true" name="520"></div></td>
                    <td><div contenteditable="true" name="521"></div></td>
                </tr>
                <tr>
                    <td>HNO<sub>3</sub></td>
                    <td><div contenteditable="true" name="530"></div></td>
                    <td><div contenteditable="true" name="531"></div></td>
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
                    <td><div contenteditable="true" name="540"></div></td>
                    <td><div contenteditable="true" name="541"></div></td>
                </tr>
                <tr>
                    <td>Sodium bicarbonate</td>
                    <td><div contenteditable="true" name="550"></div></td>
                    <td><div contenteditable="true" name="551"></div></td>
                </tr>
                <tr>
                    <td>Aluminum chloride</td>
                    <td><div contenteditable="true" name="560"></div></td>
                    <td><div contenteditable="true" name="561"></div></td>
                </tr>
                <tr>
                    <td>Lithium sulfite</td>
                    <td><div contenteditable="true" name="570"></div></td>
                    <td><div contenteditable="true" name="571"></div></td>
                </tr>
                <tr>
                    <td>Dinitrogen monoxide</td>
                    <td><div contenteditable="true" name="580"></div></td>
                    <td><div contenteditable="true" name="581"></div></td>
                </tr>
                <tr>
                    <td>Iron (III) hydroxide</td>
                    <td><div contenteditable="true" name="590"></div></td>
                    <td><div contenteditable="true" name="591"></div></td>
                </tr>
                <tr>
                    <td>Magnesium nitrate</td>
                    <td><div contenteditable="true" name="600"></div></td>
                    <td><div contenteditable="true" name="601"></div></td>
                </tr>
                <tr>
                    <td>Xenon tetrafluoride</td>
                    <td><div contenteditable="true" name="610"></div></td>
                    <td><div contenteditable="true" name="611"></div></td>
                </tr>
                <tr>
                    <td>Hydrofluoric acid</td>
                    <td><div contenteditable="true" name="620"></div></td>
                    <td><div contenteditable="true" name="621"></div></td>
                </tr>
                <tr>
                    <td>Nitrogen dioxide</td>
                    <td><div contenteditable="true" name="630"></div></td>
                    <td><div contenteditable="true" name="631"></div></td>
                </tr>
                <tr>
                    <td>Phosphorous pentoxide</td>
                    <td><div contenteditable="true" name="640"></div></td>
                    <td><div contenteditable="true" name="641"></div></td>
                </tr>
                <tr>
                    <td>Zinc dichromate</td>
                    <td><div contenteditable="true" name="650"></div></td>
                    <td><div contenteditable="true" name="651"></div></td>
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
                    <td><div contenteditable="true" name="660"></div></td>
                    <td><div contenteditable="true" name="661"></div></td>
                </tr>
                <tr>
                    <td>Zn(OH)<sub>2</sub></td>
                    <td><div contenteditable="true" name="670"></div></td>
                    <td><div contenteditable="true" name="671"></div></td>
                </tr>
                <tr>
                    <td>Co(NO<sub>3</sub>)<sub>3</sub></td>
                    <td><div contenteditable="true" name="680"></div></td>
                    <td><div contenteditable="true" name="681"></div></td>
                </tr>
                <tr>
                    <td>NO<sub>3</sub></td>
                    <td><div contenteditable="true" name="690"></div></td>
                    <td><div contenteditable="true" name="691"></div></td>
                </tr>
                <tr>
                    <td>PCl<sub>5</sub></td>
                    <td><div contenteditable="true" name="700"></div></td>
                    <td><div contenteditable="true" name="701"></div></td>
                </tr>
                <tr>
                    <td>CrO</td>
                    <td><div contenteditable="true" name="710"></div></td>
                    <td><div contenteditable="true" name="711"></div></td>
                </tr>
                <tr>
                    <td>N<sub>2</sub>O<sub>4</sub></td>
                    <td><div contenteditable="true" name="720"></div></td>
                    <td><div contenteditable="true" name="721"></div></td>
                </tr>
                <tr>
                    <td>H<sub>2</sub>SO<sub>4</sub></td>
                    <td><div contenteditable="true" name="730"></div></td>
                    <td><div contenteditable="true" name="731"></div></td>
                </tr>
            </table>
            <br />
            <input type="reset" value="Clear" />
            <input type="submit" name="save_button" value="Save" />
            <input type="submit" name="check_button" value="Check" />
            <input type="submit" name="submit_button" value="Submit" /> 
        </form>
    </body>
</html>
</bbNG:learningSystemPage>