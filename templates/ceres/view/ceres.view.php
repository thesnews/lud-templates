<?php
/*
 Title: ceres\view

 Group: Views

 File: ceres.view.php
  Provides ceres view

 Version:
  2011.03.24

 Copyright:
  2004-2011 The State News, Inc

 Author:
  Mike Joseph <josephm5@msu.edu>

 License:
  GNU GPL 2.0 - http://opensource.org/licenses/gpl-2.0.php
*/
namespace ceres\view\ceres;

use foundry\response as Response;
use foundry\fs\path as Path;
use foundry\view as View;
use foundry\view\template as Template;
use foundry\url as URL;


function main($request, $payload, $kwargs=array()) {
	if($request->action == 'main') {
		$payload['front_page'] = true;
	}

	$ext = 'tpl';

	$str = sprintf('%s/%s.%s', $request->controller,
		$request->action, $ext);

	$tpl = new Template($str);

	$res = new Response;

	$payload['isXHR'] = $request->isXHR();

	$res->content = $tpl->render($payload);

	return $res;
}


function search($request, $payload, $kwargs=array()) {
	$pag = $payload['pagination'];
	$searchParams = $payload['searchParams'];
	$pag->setURL(URL::site('ceres:ceres/search', $searchParams));
	$payload['pagination'] = $pag;

	$ext = 'tpl';

	$str = sprintf('%s/%s.%s', $request->controller,
		$request->action, $ext);

	$tpl = new Template($str);

	$res = new Response;

	$payload['isXHR'] = $request->isXHR();

	$res->content = $tpl->render($payload);

	return $res;
}


/*
 Function: listing
  Main action and default callback for the ceres controller

 Parameters:
  request - _object_ current request instances
  payload - _mixed_ payload returned from controller action
  kwargs - _array_ (optional) additional keyword arguments

 Returns:
  _object_ returns foundry\request instance

 Namespace:
  \ceres\view\ceres
*/
function listing($request, $payload, $kwargs=array()) {
	$ext = 'tpl';

	$str = sprintf('%s/%s.%s', $request->controller,
		$request->action, $ext);

	$tpl = new Template($str);

	$res = new Response;

	$payload['isXHR'] = $request->isXHR();

	$res->content = $tpl->render($payload);

	return $res;
}

/*
 Function: mobile
  Main action and default callback for the ceres controller

 Parameters:
  request - _object_ current request instances
  payload - _mixed_ payload returned from controller action
  kwargs - _array_ (optional) additional keyword arguments

 Returns:
  _object_ returns foundry\request instance

 Namespace:
  \ceres\view\ceres
*/
function mobile($request, $payload, $kwargs=array()) {

	$ext = 'tpl';

	$tpl = $request->action;
	if( $request->get(':id', array('help', 'more')) ) {
		$tpl = $request->get(':id', array('help', 'more'));
	}

	$str = sprintf('%s/%s.%s', $request->controller, $tpl, $ext);

	$tpl = new Template($str);

	$res = new Response;

	$payload['isXHR'] = $request->isXHR();

	$res->content = $tpl->render($payload);

	return $res;
}

?>
