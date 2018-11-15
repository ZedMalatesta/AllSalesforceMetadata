<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>New_Department_Sending</fullName>
        <description>New Department Sending</description>
        <protected>false</protected>
        <recipients>
            <field>Office_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_Department</template>
    </alerts>
    <fieldUpdates>
        <fullName>Department_Email</fullName>
        <field>Office_Director_Email__c</field>
        <formula>Office__r.Director__r.Email__c</formula>
        <name>Department_Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>New Department Created</fullName>
        <actions>
            <name>New_Department_Sending</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Department_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>NOT((ISNULL(Office__r.Director__c)))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
