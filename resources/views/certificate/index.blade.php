<!DOCTYPE html>
<html dir="rtl">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>Certificate of Completion</title>

    {{--<link href="https://fonts.googleapis.com/css?family=Dancing+Script:400,700" rel="stylesheet">--}}
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Lobster+Two:400,700" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@400;700&display=swap" rel="stylesheet">



    {{--<style>
        @font-face {
            font-family: 'Lobster Two';
            src: url({{public_path('/fonts/lobster/LobsterTwo-Bold.ttf')}}) format('truetype'),
            url({{public_path('/fonts/lobster/LobsterTwo-BoldItalic.ttf')}}) format('truetype'),
            url({{public_path('/fonts/lobster/LobsterTwo-Italic.ttf')}}) format('truetype'),
            url({{public_path('/fonts/lobster/LobsterTwo-Regular.ttf')}}) format('truetype'),

        }

        body, h1, h2, h3, h4, span, div {
            /*font-family: 'Dancing Script', cursive;*/
            font-family: 'Lobster Two', cursive;

        }

        body {
            margin: 0px;
            color: #37231a;
            
        }

        .main-border {
            border: 20px solid darkred;
        }

        .row {
            position: relative;
        }

        /*.main-border .row{*/
        /*height: 800px;*/
        /*}*/
        .main-border .row h1 {
            font-size: 80px;
        }

        .banner {
            position: absolute;
            left: 0;
            right: 0;
            margin: auto;
        }

        .badge-img {
            right: 0;
            top: 0;
        }

        .logo {
            left: 40%;
            position: absolute;
            bottom: 22%;
            right: 0;
            display: inline-block;
            margin: auto;
        }

        /*.container-fluid {*/
        /*width: 1200px;*/
        /*height: 855px;*/
        /*}*/

        .wrapper {
            position: absolute;
            left: 0;
            top: 50%;
            right: 0;
            margin: auto;
        }

        .text-block {
            position: absolute;
            right: 0;
            margin: auto;
            top: 40%;
            left: 0;
            text-align: center;
        }

        .text-block p {
            line-height: 1;
            margin-top: 30px;
            font-size: 30px;
            opacity: 0.9;
        }

        .font-weight-bold {
            font-weight: bolder;
        }
    </style> --}}
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>

<style>
    body {
        font-family: 'Cairo', sans-serif;
        /* height: 100vh; */
        width:100%;
    }
    
    .wrapper {
        /* height: 100%; */
        width:100%;
    }
    
    .inner-wrapper {
        position: relative;
        max-width: 1024px;
        margin: 0 auto;
        /* height: 100%; */
        width:100%;
    }
    
    .bg-certificate {
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: url(https://buscsi.com/images/certificate.jpg);
        background-size: contain;
        background-repeat: no-repeat;
        background-position: center;
    }
    
    .infos-certificate {
        position: absolute;
        top: 50%;
        width: 80%;
        left: 50%;
        transform: translate(-50%, -10%);
    }
    
    .title-heading {
        text-align: center;
        margin-bottom: 5px;
        font-size: 24px;
    }
    
    .student-name {
        font-weight: 700;
    }
    
    .course-name {
        text-align: center;
        font-weight: 700;
        font-size: 24px;
        color: #5f6062;
        margin-bottom: 5px;
        
    }
    
    .hint {
        margin-bottom: 5px;
        font-size: 18px;
        text-align: center;
    }
    
    .complete-date {
        display: flex;
        flex-direction: column;
        text-align: left;
        font-weight: 700;
        margin-bottom: 0;
        margin-top: 115px;
        color: #5f6062;
        
    }
</style>

<body><div class="wrapper">
        <div class="inner-wrapper">
            <div class="bg-certificate">
                <div class="infos-certificate">
                    <p class="title-heading">هذا الشهادة تؤكد اتمام المتدرب/ة <span class="student-name">{{$data['name']}}</span> للدورة التدريبية</p>
                    <p class="course-name">{{$data['course_name']}}</p>
                    <p class="hint">على منصة التدريب الإلكترونية لمعهد الدراسات و الخدمات الاستشارية بجامعة الباحة</p>
                    <p class="complete-date">
                        <span class="label">تاريخ الإصدار</span>
                        <span class="date">{{$data['date']}}</span>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid px-0 d-none" style="height: 500px">
        <div style="position: relative;text-align: center"
            class="row h-100 justify-content-center text-center position-relative m-0">
            <img class="logo" src="{{public_path('storage/logos/'.config('logo_b_image'))}}">

            <div class="col-12 text-block align-self-center">
                <p class="text-center mb-0">هذا الشهادة تؤكد اتمام المتدرب/ة <span class="font-weight-bold" style="font-family: DejaVu Sans;">{{$data['name']}}</span> للدورة التدريبية:
                </p>
                <p style="word-wrap: break-word;white-space: nowrap"><span class="font-weight-bold" style="font-family: DejaVu Sans;">{{$data['course_name']}}</span>
                </p>
                <p  style="word-wrap: break-word;white-space: nowrap">on <span class="font-weight-bold" style="font-family: DejaVu Sans;">{{config('app.name')}}</span> بتاريخ <span class="font-weight-bold">{{$data['date']}}</span></p>
            </div>
            <img width="100%" src="{{public_path('images/certificate.jpg')}}">
        </div></div></body></html>