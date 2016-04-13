$imagesFolder = [Environment]::GetFolderPath("LocalApplicationData") + "\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets";
$outputPath = [Environment]::GetFolderPath("MyPictures") + "\Spotlight Images";

$File = Get-ChildItem -Path $imagesFolder -Recurse

if(!(Test-Path -Path $outputPath )){
    New-Item -ItemType directory -Path $outputPath
}

for($i = 0; $i -lt $File.Count; $i++)
{
   if ($File[$i].Length -gt 250000)
   {
    Copy-Item $File[$i].FullName ($outputPath + "\" + $File[$i].BaseName + ".jpg");
   }
}