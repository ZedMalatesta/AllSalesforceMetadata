<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>New_Employee_Sending</fullName>
        <description>New Employee Sending</description>
        <protected>false</protected>
        <recipients>
            <field>Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_template_name</template>
    </alerts>
    <alerts>
        <fullName>wwew</fullName>
        <description>wwew</description>
        <protected>false</protected>
        <recipients>
            <field>Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/X32</template>
    </alerts>
    <fieldUpdates>
        <fullName>Adding_Employees</fullName>
        <field>Employees_Number__c</field>
        <formula>IF(ISNULL(Department__r.Employees_Number__c),1,Department__r.Employees_Number__c+1)</formula>
        <name>Adding Employees</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Department__c</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Manager_Email_Update</fullName>
        <field>Manager_Email__c</field>
        <formula>Manager__r.Email__c</formula>
        <name>Manager Email Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Counting Employees</fullName>
        <actions>
            <name>Adding_Employees</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Department__c &lt;&gt; null</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Sending email to manager</fullName>
        <actions>
            <name>New_Employee_Sending</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Manager_Email_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>NOT((ISNULL( Manager__c )))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>wwew</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Employee__c.Expiration_date__c</offsetFromField>
            <timeLength>-10</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
