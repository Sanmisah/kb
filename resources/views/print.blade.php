<?php
use Carbon\Carbon;
?>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <style>
            @page {
                margin: 30px 35px;
                footer: html_myFooter;
            }
            body {
                font-family:  serif;
                font-size: 14px;
            }
            h3 {
                text-align: center;
                margin-bottom: 0;
            }
            table{
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }
            td, th {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }
            tr:nth-child(even) {
                background-color: #dddddd;
            }
            p {
                margin-top: 5px;
                margin-bottom: 5px;
            }
            .tr{
                border:none;
            }
            .footer {
                position: fixed;
                bottom: 0;
                width: 100%;
            }           
        </style>
    </head>
    <body>
        <div class="table-responsive">
            <htmlpagefooter name="myFooter">            
            </htmlpagefooter>
            <br> <br> <br>
            <div>
                <h2 align="center"><strong>Client Report</strong></h2>
            </div>
            <div>                
                @if(isset($toDate) && isset($fromDate))
                    <h3 align="center">
                        From Date: {{ date('d-m-Y', strtotime($fromDate)) }}
                        &nbsp;&nbsp;
                        To Date: {{ date('d-m-Y', strtotime($toDate)) }}
                    </h3>
                @endif
            </div>
            <br>
            <table>
                <thead>
                    <tr>
                    <th>Client Name</th>
                    <th>Address</th>
                    <th>Pin Code</th>
                    <th>Contact No</th>
                    <th>Email</th>
                    <th>DOB</th>
                    <th>Office Aaddress</th>
                    <th>Office Contact No </th>
                    <th>Office Pin Code </th>
                    </tr>
                </thead>
                <tbody>
                @if(!empty($clients))
                    @foreach($clients as $client)                           
                        <tr>
                            <td>{{ $client->client_name }}</td>           
                            <td>{{ $client->address_line_1 }} <br/> {{ $client->address_line_2 }}</td>
                            <td>{{ $client->pin_code }}</td>
                            <td>{{ $client->contact_no }}</td>
                            <td>{{ $client->email }}</td>
                            <td>{{ $client->dob }}</td>
                            <td>{{ $client->office_address_1 }} <br/> {{ $client->office_address_2 }}</td>
                            <td>{{ $client->office_contact_no }}</td>
                            <td>{{ $client->office_pin_code }}</td>       
                        </tr>
                    @endforeach
                @endif
                </tbody>
            </table>
            <div class="footer">
                <hr>
                <p style="text-align:right"> <?php echo Carbon::now(); ?></p>
            </div>
        </div>
        
    </body>
</html>