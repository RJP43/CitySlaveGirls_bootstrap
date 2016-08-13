<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="html" encoding="utf-8" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <div class="col-md-3">
            <div id="sideNav" class="panel panel-default">
                <div class="panel-body">
                    <h2>Filter Text</h2>
                    <ul class="nav nav-pills nav-stacked">
                        <xsl:if test="//said[@who = '#nellNelson']">
                            <li>
                                <input type="checkbox" value="nellNelson"/>
                                <span class="nellNelson">Nell Nelson</span>
                            </li>
                        </xsl:if>
                        <xsl:if test="//said[@ana = 'male']">
                            <li>
                                <input type="checkbox" value="male"/>
                                <span class="male">Male</span>
                            </li>
                        </xsl:if>
                        <xsl:if test="//said[@ana = 'female' and not(@who = '#nellNelson')]">
                            <li>
                                <input type="checkbox" value="female"/>
                                <span class="female">Female</span>
                            </li>
                        </xsl:if>
                        <xsl:if test="//said[@ana = 'unknown']">
                            <li>
                                <input type="checkbox" value="unknown"/>
                                <span class="unknown">Unknown</span>
                            </li>
                        </xsl:if>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-md-9 article">
            <div class="articleHead">
                <h1 class="newspaperTitle">
                    <i>The Chicago Times</i>
                </h1>
                <h2 class="date">
                    <xsl:apply-templates select="//head//date"/>
                </h2>
            </div>
            <div class="headlinesGrp">
                <ul class="headlinesList_main">
                    <xsl:apply-templates select="//div[@type = 'headlines'][1]//item"/>
                </ul>
            </div>
            <div class="articleText">
                <xsl:apply-templates select="//div[@type = 'articleBody'][1]"/>
            </div>
            <xsl:if test="//div[@type = 'headlines'][2]">
                <hr/>
                <div class="headlinesGrp">
                    <ul class="headlinesList_main">
                        <xsl:apply-templates select="//div[@type = 'headline'][1]//item"/>
                        <xsl:apply-templates select="//div[@type = 'headlines'][2]//item"/>
                    </ul>
                </div>
                <div class="articleText">
                    <xsl:apply-templates select="//div[@type = 'articleBody'][2]"/>
                </div>
            </xsl:if>
            <xsl:if test="//div[@type = 'headlines'][3]">
                <hr/>
                <div class="headlinesGrp">
                    <ul class="headlinesList_main">
                        <xsl:apply-templates select="//div[@type = 'headline'][2]//item"/>
                        <xsl:apply-templates select="//div[@type = 'headlines'][3]//item"/>
                    </ul>
                </div>
                <div class="articleText">
                    <xsl:apply-templates select="//div[@type = 'articleBody'][3]"/>
                </div>
            </xsl:if>
        </div>
        <xsl:if test="//div[@type = 'advertisement']">
            <div class="col-md-8 seriesPromo">
                <span class="adDisclaimer">
                    <xsl:text>The following is an advertisement pertaining to the series that was featured at the end of this article.</xsl:text>
                </span>
                <h1 class="adHead">
                    <xsl:apply-templates select="//div[@type = 'advertisement']/head"/>
                </h1>
                <div class="adBody">
                    <xsl:apply-templates select="//div[@type = 'advertisement']//p"/>
                </div>
            </div>
        </xsl:if>
    </xsl:template>
    <xsl:template match="item">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    <xsl:template match="p">
        <p class="ArtAdP">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="said">
        <xsl:choose>
            <xsl:when test="@who = '#nellNelson'">
                <span class="nellNelson">
                    <q class="dialogue">
                        <xsl:apply-templates/>
                    </q>
                </span>
            </xsl:when>
            <xsl:when test="@ana = 'male'">
                <span class="male">
                    <q class="dialogue">
                        <xsl:apply-templates/>
                    </q>
                </span>
            </xsl:when>
            <xsl:when test="@ana = 'female' and not(@who = '#nellNelson')">
                <span class="female">
                    <q class="dialogue">
                        <xsl:apply-templates/>
                    </q>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <span class="unknown">
                    <q class="dialogue">
                        <xsl:apply-templates/>
                    </q>
                </span>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="@who = '#inspector'">
                <span class="inspector">
                    <q class="dialogue">
                        <xsl:apply-templates/>
                    </q>
                </span>
            </xsl:when>
            <xsl:when test="@who = '#workingGirl'">
                <span class="workingGirl">
                    <q class="dialogue">
                        <xsl:apply-templates/>
                    </q>
                </span>
            </xsl:when>
            <xsl:when test="@who = '#employer'">
                <span class="employer">
                    <q class="dialogue">
                        <xsl:apply-templates/>
                    </q>
                </span>
            </xsl:when>
            <xsl:when test="@who = '#foreperson'">
                <span class="foreperson">
                    <q class="dialogue">
                        <xsl:apply-templates/>
                    </q>
                </span>
            </xsl:when>
            <xsl:when test="@who = '#employee'">
                <span class="employee">
                    <q class="dialogue">
                        <xsl:apply-templates/>
                    </q>
                </span>
            </xsl:when>
            <xsl:when test="@who = '#benefactor'">
                <span class="benefactor">
                    <q class="dialogue">
                        <xsl:apply-templates/>
                    </q>
                </span>
            </xsl:when>
            <xsl:when test="@who = '#messenger'">
                <span class="messenger">
                    <q class="dialogue">
                        <xsl:apply-templates/>
                    </q>
                </span>
            </xsl:when>
            <xsl:when test="@who = '#promMen'">
                <span class="promMan">
                    <q class="dialogue">
                        <xsl:apply-templates/>
                    </q>
                </span>
            </xsl:when>
            <xsl:when test="@who = '#promWomen'">
                <span class="promWoman">
                    <q class="dialogue">
                        <xsl:apply-templates/>
                    </q>
                </span>
            </xsl:when>
            <xsl:when test="@who = '#reporter'">
                <span class="reporter">
                    <q class="dialogue">
                        <xsl:apply-templates/>
                    </q>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <span class="unknown">
                    <q class="dialogue">
                        <xsl:apply-templates/>
                    </q>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!--<xsl:template match="said">
        <q class="dialogue">
            <xsl:apply-templates/>
        </q>
    </xsl:template>-->
    <!-- RJP:2016-08-01: This is the generic rule for dialogue WITHOUT specifications for gender or archetype! -->
    <xsl:template match="rdg">
        <xsl:if test="@wit[contains(., '#CT')]">
            <span class="CT">
                <xsl:apply-templates/>
            </span>
        </xsl:if>
        <xsl:if test="@wit[contains(., '#WSGC')]">
            <span class="WSGC">
                <xsl:apply-templates/>
            </span>
        </xsl:if>
        <xsl:if test="@wit[contains(., '#WSGFA')]">
            <span class="WSGFA">
                <xsl:apply-templates/>
            </span>
        </xsl:if>
    </xsl:template>
    <xsl:template match="hi">
        <xsl:choose>
            <xsl:when test="@rend = 'double'">
                <q class="double">
                    <xsl:apply-templates/>
                </q>
            </xsl:when>
            <xsl:otherwise>
                <q class="single">
                    <xsl:apply-templates/>
                </q>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="unclear">
        <xsl:choose>
            <xsl:when test="./supplied">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <span class="missText"
                    title="Due to the poor quality of this article's photocopy, the text is unclear and could not be transcribed.">
                    <xsl:text> [MISSING TEXT] </xsl:text>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="sic">
        <span class="oddSpell"
            title="Spelling retained from original article: {following-sibling::*}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="reg"/>
    <xsl:template match="name[@ref = '#CT']">
        <span class="chicTimes">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="orgName">
        <xsl:choose>
            <xsl:when test="@type = 'exposedCompany'">
                <span class="exposComp">
                    <!--<span class="{@ref/substring-after(.,'#')}">-->
                    <xsl:apply-templates/>
                    <!--</span>-->
                </span>
            </xsl:when>
            <xsl:otherwise>
                <span class="org">
                    <!--<span class="{@ref/substring-after(.,'#')}">-->
                    <xsl:apply-templates/>
                    <!--</span>-->
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="placeName">
        <xsl:choose>
            <xsl:when test="@type = 'address'">
                <span class="address">
                    <!--<span class="{@ref/substring-after(.,'#')}">-->
                    <xsl:apply-templates/>
                    <!--</span>-->
                </span>
            </xsl:when>
            <xsl:otherwise>
                <span class="place">
                    <xsl:apply-templates/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
