import 'package:flutter/material.dart';

import 'app.dart';
import 'google_sheet_provider.dart';
const credentials = r'''
{
  "type": "service_account",
  "project_id": "backenduser",
  "private_key_id": "2e26486fd615b168b157b27f94d1a50c776fb9a3",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDqr9r8UXbszxpq\nc7a3GHiDAR10NsQqexG7JzZtXR2wvh3zOIe9Y3iQiZwPuBqpfJGP3mtY1u+mDaG9\nWjAzO3/hG+cuxOqE//DV9QcAFUt+UdYkQf746L89kzTQ9l8DORahn9ampen9v2JZ\n3LV/jnED5I78P2wyEI+KIGb0UXo/W+nPga3xHLVqBtjiTawqYN02KM7FCcuwoBN7\ns9QdhuoLqxE5zAE4tiDJabBXfmdTcOWD0roTxKodUcAbMh41wwSue1J816fs8eIn\nRKQ2aG3aIcpQDBHnhUCoOLKb9c4vNeZurzbvIhrf6UrXjcBHMYf0BoClfILlzQlm\n0hR3wVj5AgMBAAECggEAB9ZRjwWFbCyfsYols8hBwKuK+UKn0+5z+JM7btiiNNuN\nWZqC5e8xcoTglBOVSFocQdx2Ks7+PuKSw9Agp7ccZLDZ9vv6ddQdxrA980VRAKLM\niyE0Lx8VwSwY98Ou6wcw6YHu2QRHY8oFXOXC9Bj5+Wr432p+V7KNNsv4NfhBQILJ\nqj09OfFDLFG4aG1VBkI6rvr13Kixc3umWJzYGy4bUv3WWCEKIatiWwy92VOH1Xhs\nMFDM8VGCrcC8rOei5om+KtZSOBpOVN5rXMz7DqrCjLBI1d6U4d5CMurATrgbnFZi\nIvJCPiDG93Xq/lHxdoRE3XCzEtm0CQ7AjrqXimQClQKBgQD5HnjKyvILSRdhLFWM\n3z5W5bPrztZQ2Z9AcPJF0NY4nGamaodW45XZsonXcH15Fjo4ipXt+ullKvNwjTOW\nWpd7BnbE7KP7iIAA9h3oKbvz2kw/BL+NPx5rrPU0jadfXSwIUIdtyx9nHzhKgMce\nMqk1IDoLec00cHgG5+AXpxZodwKBgQDxK1VzGDPq95d8CNeGch80R4EfQoguR832\nJFZ0jMQafXeL9/tLGWj0FFDNXbzpfsDBcsXVFwyHJe4zjJsqh+15FRh7z9nrAQWM\npbt83FwQvKjZ+O2AOaoilBZJ9hVjz95nDbhXVWIqlOEdX0iGB/T1gS0iL6LNxyjQ\nNOJpaAEWDwKBgEsehyoPfGEuzx/8MGfkQXYOmex3WGTU2pKh/ExVJuO3NbTk1p66\nzcrxbWNLhmpm63N1RrSWPp7FDtdXnMCv3JG6Z0IGYYRNqtufW3FQdF6Z6vftxJ0g\n9VletCn+tQOqosZ3Ef9nirab0WuV3XUbra5ZY2dmeRxg9bCPZyF6vuUNAoGAQjwD\ngNOh1qNfMEqBXsRS+5mzxbERE5zW3QYH1ISgiyHwRjm6A1scLwSxWGWpL3uHVtm9\nqZNl9mwdanzwVJL2Tm3TxpVEJT2nl4Qg5N7kThhyS0MJf1DXAB4prPBv2XTKgQUM\nnreteUJgPR/hHCZtSUvL6HqqvNc4x03u7MIKolMCgYB/kyI+HtdR9GSEqC5SkjDi\nLk/Wwkf4ojPGfiU86GEmVvpUZqzHy5GdZ3pTbYSsBcd9qrADwSzljn8gsNuR3PRD\nnQbBoLhOoG2BrzLvFqLjlKOIVAMHwW+kJ7BdyDn0ymVtKuRcHlWI89GfwJi5N5Ne\ne7oU4LqgrVGcM8ZNsEV3hg==\n-----END PRIVATE KEY-----\n",
  "client_email": "backenduser@backenduser.iam.gserviceaccount.com",
  "client_id": "111068451156810124760",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/backenduser%40backenduser.iam.gserviceaccount.com"
}
''';
const spreadsheetId = "136ZtX1S5c7tEnYGwJ-_P0ojNRdCzlEpF79t9V7FJ_EQ";
//const spreadsheetId = "1Vt5_NA_fhp_GankK_AAw1YQTMCuvmEp1mZR7P5Z8eVg";

void main() async {
  final provider = GoogleSheetsProvider(credentials);

  /// Initialize provider
  await provider.initializeForWorksheet(spreadsheetId, "User2");

  runApp(SheetsApp(
    provider: provider,
  ));
}
