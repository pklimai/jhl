<?xml version="1.0" standalone="yes"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:junos="http://xml.juniper.net/junos/*/junos"
    xmlns:xnm="http://xml.juniper.net/xnm/1.1/xnm"
    xmlns:jcs="http://xml.juniper.net/junos/commit-scripts/1.0">
<xsl:import href="../import/junos.xsl"/>

<xsl:template match="/">
<op-script-results>


    <chassis-inventory xmlns="http://xml.juniper.net/junos/18.3R1/junos-chassis">
        <chassis junos:style="inventory">
            <name>Chassis</name>
            <serial-number>000000000000</serial-number>
            <description>VMX</description>
            <chassis-module>
                <name>Midplane</name>
            </chassis-module>
            <chassis-module>
                <name>Routing Engine 0</name>
                <description>RE-VMX</description>
            </chassis-module>
            <chassis-module>
                <name>CB 0</name>
                <description>VMX SCB</description>
            </chassis-module>
            <chassis-module>
                <name>FPC 0</name>
                <description>Virtual FPC</description>
                <chassis-sub-module>
                    <name>CPU</name>
                    <version>Rev. 1.0</version>
                    <part-number>RIOT-LITE</part-number>
                    <serial-number>BUILTIN</serial-number>
                </chassis-sub-module>
                <chassis-sub-module>
                    <name>MIC 0</name>
                    <description>Virtual</description>
                    <chassis-sub-sub-module>
                        <name>PIC 0</name>
                        <part-number>BUILTIN</part-number>
                        <serial-number>BUILTIN</serial-number>
                        <description>Virtual</description>
                    </chassis-sub-sub-module>
                </chassis-sub-module>
            </chassis-module>
        </chassis>
    </chassis-inventory>


</op-script-results>
</xsl:template>

</xsl:stylesheet>
