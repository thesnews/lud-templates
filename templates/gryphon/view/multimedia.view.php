<?php
namespace gryphon\view\multimedia;

use foundry\response as Response;
use foundry\fs\path as Path;
use foundry\view as View;
use foundry\view\template as Template;
use foundry\request\url as URL;
use foundry\config as Conf;

use foundry\model as M;

/*
 Function: main
  Main action and default callback for the section controller

 Parameters:
  request - _object_ current request instances
  payload - _mixed_ payload returned from controller action
  kwargs - _array_ (optional) additional keyword arguments

 Returns:
  _object_ returns foundry\request instance

 Namespace:
  \gryphon\view\multimedia
*/
function main($request, $payload, $kwargs=array()) {
	$slug = $payload['slug'];

	$ext = 'tpl';
	if( $request->getSegment(0) == 'm' ) {
		$ext = 'mbl';
	}

	if( $slug ) {
		$str = sprintf('multimedia/templates/%s.%s', $slug, $ext);
		$payload['subActive'] = ucfirst($slug);
	} else {
		$str = sprintf('multimedia/main.%s', $ext);
	}

	if( $request->get(':id', 'num') == 6142 ) {
		$payload['theID'] = $request->get(':id', 'num');
		$str = sprintf('multimedia/templates/vid.%s', $ext);
	}


	$s = $request->getSession();

	$payload['referrer'] = $s->get('article_referrer');

	$tpl = new Template($str);

	$res = new Response;
	$res->content = $tpl->render($payload);

	return $res;
}
/*
 Function: xml
  XML handler callback. Generates ATOM feed

 Parameters:
  request - _object_ current request instances
  payload - _mixed_ payload returned from controller action
  kwargs - _array_ (optional) additional keyword arguments

 Returns:
  _object_ returns foundry\request instance

 Namespace:
  \gryphon\view\section
*/
function xml($request, $payload, $kwargs=array()) {
	$res = new Response;

	$pub = Conf::get('gryphon:publication:name');
	$entries = $payload['media']->serialize('atom');
	$lastUpdate = date('c', $payload['media']->peekFront()->created);

$res->content = <<<ATOM
<?xml version="1.0" encoding="UTF-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
	<title>{$pub} : {$payload['section']->name}</title>
	<link href="{$payload['section']->url}.xml" rel="self" />
	<id>{$payload['section']->url}.xml</id>
	<updated>{$lastUpdate}</updated>
	$entries
</feed>
ATOM;

	$res->setHeader('Content-Type', 'application/atom+xml');

	return $res;
}


?>