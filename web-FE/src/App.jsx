/* eslint-disable import/no-unresolved */
import React from 'react';
import { BrowserRouter, Route, Switch } from 'react-router-dom';
import Home from '@Components/Home';
import Login from '@Components/Login';
import Label from '@Components/Label';
import Milestone from '@Components/Milestone';
import IssueListPage from '@Components/Issue';
import NewIssue from '@Components/NewIssue';
import UserStore from '@Stores/UserStore';
import LabelStore from '@Stores/LabelStore';
import MilestoneStore from '@Stores/MilestoneStore';

const App = () => (
  <UserStore>
    <MilestoneStore>
      <LabelStore>
        <BrowserRouter>
          <Switch>
            <Route path='/login' component={Login} />
            <Route path='/label' component={Label} />
            <Route path='/milestone' component={Milestone} />
            <Route exact path='/issue' component={IssueListPage} />
            <Route exact path='/newIssue' component={NewIssue} />
            <Route path='/' component={Home} />
          </Switch>
        </BrowserRouter>
      </LabelStore>
    </MilestoneStore>
  </UserStore>
);

export default App;
