# frozen_string_literal: true
require "cgi"
require "time"

# Preserve the previous Hugo archive, pagination, and RSS URLs.
class LegacyRoutes < Jekyll::Generator
  safe true
  priority :lowest

  def generate(site)
    index = site.data.fetch("content_index", [])
    ["en", "zh-cn"].each do |lang|
      prefix = lang == "en" ? "" : "/zh-cn"
      targets = { "#{prefix}/page/1/" => "#{prefix}/" }
      %w[categories categories/markdown categories/markdown/page/1 tags tags/html tags/html/page/1 tags/markdown tags/markdown/page/1].each do |path|
        targets["#{prefix}/#{path}/"] = "#{prefix}/posts/"
      end
      sections = index.select { |p| p["lang"] == lang && p["content_kind"] == "section" && p["section_key"] != "posts" }
      sections.each { |p| targets["#{p['url']}page/1/"] = p["url"] }
      targets["/en/"] = "/" if lang == "en"
      targets.each do |url, target|
        next if site.pages.any? { |p| p.url == url }
        page = Jekyll::PageWithoutAFile.new(site, site.source, url.delete_prefix("/"), "index.html")
        absolute = "#{site.config['url']}#{site.config['baseurl']}#{target}"
        page.data.merge!("permalink" => url, "layout" => nil, "sitemap" => false, "render_with_liquid" => false)
        page.content = %(<!doctype html><html lang="#{lang == 'en' ? 'en' : 'zh-CN'}"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Di Yu</title><link rel="canonical" href="#{CGI.escapeHTML(absolute)}"><meta http-equiv="refresh" content="0; url=#{CGI.escapeHTML(target)}"></head><body><a href="#{CGI.escapeHTML(target)}">#{lang == 'en' ? 'Continue to the updated page' : '前往更新后的页面'}</a></body></html>)
        site.pages << page
      end
      feeds = [["#{prefix}/", nil]] + sections.map { |p| [p["url"], p["section_key"]] }
      feeds.each do |url, section|
        items = index.select { |p| p["lang"] == lang && p["content_kind"] == "note" && (!section || p["section_key"] == section) }
        items = items.sort_by { |p| p["date"] || Time.at(0) }.reverse.first(20)
        root = site.config["url"] + site.config["baseurl"].to_s
        body = items.map do |entry|
          link = CGI.escapeHTML(root + entry["url"])
          date = entry["date"] ? "<pubDate>#{entry['date'].rfc2822}</pubDate>" : ""
          "<item><title>#{CGI.escapeHTML(entry['title'])}</title><link>#{link}</link><guid>#{link}</guid>#{date}</item>"
        end.join
        feed = Jekyll::PageWithoutAFile.new(site, site.source, url.delete_prefix("/"), "index.xml")
        feed.data.merge!("layout" => nil, "sitemap" => false, "render_with_liquid" => false)
        feed.content = %(<?xml version="1.0" encoding="UTF-8"?><rss version="2.0"><channel><title>Di Yu</title><link>#{CGI.escapeHTML(root + url)}</link><description>#{lang == 'en' ? 'Research notes and thoughts' : '研究笔记与随想'}</description><language>#{lang}</language>#{body}</channel></rss>)
        site.pages << feed
      end
    end
  end
end
