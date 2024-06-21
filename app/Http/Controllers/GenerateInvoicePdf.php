<?php
namespace App\Http\Controllers;
// nvbishrmail@gmail.com (2021-11-28)
function dec2hex($ord)
{
    $hexCode = dechex($ord);
    return strToUpper(substr('0' . $hexCode, -2));
}
function str2hex($string)
{
    $string = $string . '';
    $hex = '';
    for ($i = 0; $i < strlen($string); $i++) {
        $ord = ord($string[$i]);
        $hex .= dec2hex($ord);
    }
    return strToUpper($hex);
}
function hex2str($hex)
{
    $string = '';
    for ($i = 0; $i < strlen($hex) - 1; $i += 2) {
        $string .= chr(hexdec($hex[$i] . $hex[$i + 1]));
    }
    return $string;
}


// Include the main TCPDF library (search for installation path).
use TCPDF;

$bill = [];
class GenerateInvoicePdf extends TCPDF
{

    public function Header()
    {
        global $bill;
		// Logo
        $image_file = K_PATH_IMAGES.'logo_example.jpg';
        $this->Image($image_file, 10, 10, 15, '', 'JPG', '', 'T', false, 300, '', false, false, 0, false, false, false);
        $html = <<<EOD
		<p>INVOICE</p>
			
EOD;

        $html = preg_replace('/(\p{P})(\p{Arabic})/u', "$1&zwnj;$2", $html);
        $html = preg_replace('/(\p{Arabic})(\p{P})/u', "$1&zwnj;$2", $html);

        $this->writeHTMLCell(0, 0, '', '', $html, 0, 1, 0, true, '', true);


        $this->SetMargins(9, $this->getY(), 9);
        $style = array(
            'fgcolor' => array(0, 0, 0),
            'bgcolor' => false
        );

    }

    public function Footer()
    {
        $this->SetFont('DejaVu Sans', '', 8);
        $this->SetY(-19);
        $this->Cell(0, 10, 'Note: This is a computer generated bill and do not require physical signature', 0, false, 'L', 0, '', 0, false, 'T', 'M');
        $this->SetY(-15);
        $this->Cell(0, 10, 'Page ' . $this->getPageNumGroupAlias() . '/' . $this->getPageGroupAlias(), 0, false, 'L', 0, '', 0, false, 'T', 'M');
    }

}
