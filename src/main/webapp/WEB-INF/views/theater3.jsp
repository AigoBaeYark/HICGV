<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>hicgv/theater</title>
<link rel="stylesheet" href="resources/css/reset.css" />

<style>
<!--
.panel.with-nav-tabs .panel-heading {
    padding: 5px 5px 0 5px;
}

.panel.with-nav-tabs .nav-tabs {
    border-bottom: none;
}

.panel.with-nav-tabs .nav-justified {
    margin-bottom: -1px;
}

/*** PANEL SUCCESS ***/
.with-nav-tabs.panel-success .nav-tabs>li>a,
.with-nav-tabs.panel-success .nav-tabs>li>a:hover,
.with-nav-tabs.panel-success .nav-tabs>li>a:focus {
    color: #3c763d;
}

.with-nav-tabs.panel-success .nav-tabs>.open>a,
.with-nav-tabs.panel-success .nav-tabs>.open>a:hover,
.with-nav-tabs.panel-success .nav-tabs>.open>a:focus,
.with-nav-tabs.panel-success .nav-tabs>li>a:hover,
.with-nav-tabs.panel-success .nav-tabs>li>a:focus {
    color: #3c763d;
    background-color: #d6e9c6;
    border-color: transparent;
}

.with-nav-tabs.panel-success .nav-tabs>li.active>a,
.with-nav-tabs.panel-success .nav-tabs>li.active>a:hover,
.with-nav-tabs.panel-success .nav-tabs>li.active>a:focus {
    color: #3c763d;
    background-color: #fff;
    border-color: #d6e9c6;
    border-bottom-color: transparent;
}

</style>

</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="panel with-nav-tabs panel-success">
                <div class="panel-heading">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab1success" data-toggle="tab">Success 1</a></li>
                        <li><a href="#tab2success" data-toggle="tab">Success 2</a></li>
                        <li><a href="#tab3success" data-toggle="tab">Success 3</a></li>
                    </ul>
                </div>
                <div class="panel-body">
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="tab1success">Success 1</div>
                        <div class="tab-pane fade" id="tab2success">Success 2</div>
                        <div class="tab-pane fade" id="tab3success">Success 3</div>
                    </div>
                </div>
            </div>
        </div>  
    </div>
</div>
<br />
</body>
</html>