<div id="change-password-modal">
    <form class ="pure-form pure-form-aligned">
        <h2 style="text-align: center">Change Password</h2>
        <fieldset>
            <div class="pure-control-group">
                <h3>Enter Current Password:</h3>
                <input type="password" placeholder="Current Password" id="currentPassword" style="width: 100%;color:black"/>
            </div>
            <div class="pure-control-group">
                <h3>Enter New Password: </h3>
                <input type="password" placeholder="New Password" id="passwordRepeat" style="width: 100%;color:black"/>
            </div>
            <div class="pure-control-group">
                <h3>Confirm New Password:</h3>
                <input type="password" placeholder="Confirm Password" id="newPassword" style="width: 100%;color:black"/>
            </div>
        </fieldset>
        <button class ="pure-button pure-input-1-2 pure-button-primary"  onclick="changePassword()" id ="registerUserButton" style="width: 100%">Change Password</button>
    </form>
</div>
