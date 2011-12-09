<?php
//Copyright iDevid ©2011

//Delete Old Certificates and Keys if exists
if (file_exists(ca.key)) exec('rm ca.key');
if (file_exists(ca.crt)) exec('rm ca.crt');
if (file_exists(server.key)) exec('rm server.csr');
if (file_exists(server.crt)) exec('rm server.key.secure');
if (file_exists(server.crt)) exec('rm server.passless.crt');
if (file_exists(server.crt)) exec('rm server.passless.key');

//Ca.key - Ca.crt

echo "Starting CertificateMaker, this could take a while...";
echo "\n";
$configkey1 = array('encrypt_key' => true, 'private_key_type' => OPENSSL_KEYTYPE_RSA, 'private_key_bits' => 4096, 'encrypt_key_cipher' => OPENSSL_CIPHER_3DES );
$key1 = openssl_pkey_new($configkey1);
openssl_pkey_export_to_file($key1, 'ca.key');
$configurationcrt = array(
   "countryName" => "EU",
   "stateOrProvinceName" => "Italy",
   "localityName" => "Napoli",
   "organizationName" => "CertificateMaker",
   "organizationalUnitName" => "CertificateMaker",
   "commonName" => "guzzoni.apple.com",
   "emailAddress" => "certificatemaker@siri.com"
);
$csr1 = openssl_csr_new($configurationcrt, $key1);
$sscert1 = openssl_csr_sign($csr1, null, $key1, 365);
openssl_x509_export_to_file($sscert1, "ca.crt");

echo "Making ca.crt and ca.key";
echo "\n";

//Server

$configkey2 = array('encrypt_key' => true, 'private_key_type' => OPENSSL_KEYTYPE_RSA, 'private_key_bits' => 409, 'encrypt_key_cipher' => OPENSSL_CIPHER_3DES );
$key2 = openssl_pkey_new($configkey2);
openssl_pkey_export_to_file($key2, 'server.key');
$csr2 = openssl_csr_new($configurationcrt, $key2);
openssl_csr_export_to_file($csr2, "server.crs");
$sscert2 = openssl_csr_sign($csr2, $sscert1, $key1, 365, null, 01);
openssl_x509_export_to_file($sscert2, "server.passless.crt");
exec ('openssl rsa -in server.key -out server.key.insecure');
exec ('mv server.key server.key.secure');
exec ('mv server.key.insecure server.passless.key');

echo "Making all the server files";
echo "\n";

echo "Done!";
echo "\n";
?>