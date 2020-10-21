import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

class Article {
  final String headline;
  final String imageLink;
  String _content;
  final String readmore;

  Article({this.headline, this.imageLink, this.readmore});

  Future<void> getArticleContent() async {
    var response = await http.get(readmore);
    dom.Document articleContent = parser.parse(response.body);
    String paragraphs =
        articleContent.getElementsByClassName('post-content')[0].innerHtml;
    _content = paragraphs;
  }

  Widget display() {
    return Card(
        child: ExpandablePanel(
            // ignore: deprecated_member_use
            hasIcon: false,
            header: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              child: Row(
                children: [
                  Expanded(
                    child: imageLink != null
                        ? Image.network(imageLink)
                        : Container(
                            alignment: Alignment.center,
                            // width: 50,
                            height: 80,
                            color: Colors.red,
                          ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 3,
                      child: Text(
                        headline,
                        softWrap: true,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ))
                ],
              ),
            ),
            expanded: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _content == null
                        ? Center(
                            child: Text("loading article...",
                                style: TextStyle(fontStyle: FontStyle.italic)),
                          )
                        : Html(
                            data: _content,
                          ),
                  ],
                ))));
  }
}
