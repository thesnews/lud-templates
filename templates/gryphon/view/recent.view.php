<?php
namespace gryphon\view\recent;

use foundry\response as Response;
use foundry\fs\path as Path;
use foundry\view as View;
use foundry\view\template as Template;
use foundry\url as URL;
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
  \gryphon\view\recent
*/

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
  \gryphon\view\recent
*/
function xml($request, $payload, $kwargs=array()) {
	$res = new Response;
	$pub = Conf::get('gryphon:publication:name');

	$articles = '';
	$comments = '';
	$lastUpdate = false;
	if( $payload['articles'] ) {
		$articles = $payload['articles']->serialize('atom');
		$lastUpdate = $payload['articles']->peekFront()->created;
	}
	if( $payload['comments'] ) {
		$comments = $payload['comments']->serialize('atom');
	}

	if( $payload['comments'] &&
		$payload['comments']->peekFront()->created > $lastUpdate ) {
		$lastUpdate = $payload['comments']->peekFront()->created;
	}

	$lastUpdate = date('c', $lastUpdate);

	if( $payload['articles'] && !$payload['comments'] ) {
		$url = URL::site('gryphon:recent/article', true);

		// get a template
		$tpl = new Template('recent/article.xml');
		$res = new Response;
		$res->content = $tpl->render($payload);
		$res->setHeader('Content-Type', 'application/rss+xml');
		return $res;

	} elseif( $payload['comments'] && !$payload['articles'] ) {
		$url = URL::site('gryphon:recent/comment', true);
	} else {
		$url = URL::site('gryphon:recent', true);
	}

	// disable everything
	$articles = 0;

$res->content = <<<ATOM
<?xml version="1.0" encoding="UTF-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
	<title>{$pub}</title>
	<link href="{$url}.xml" rel="self" />
	<id>{$url}.xml</id>
	<updated>{$lastUpdate}</updated>
	{$articles}
	{$comments}
</feed>
ATOM;

	$res->setHeader('Content-Type', 'application/atom+xml');

	return $res;
}

?>
