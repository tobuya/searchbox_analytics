// Import your application controller
import { application } from 'controllers/application';

// Import the necessary functions from Stimulus
import { Application } from '@hotwired/stimulus';
import { definitionsFromContext } from 'stimulus/webpack-helpers';

// Start the Stimulus application
const stimulusApplication = Application.start();

// Load all controllers from the 'controllers' directory
const context = require.context('.', true, /_controller\.js$/);
stimulusApplication.load(definitionsFromContext(context));

// Register your application controller
stimulusApplication.register('application', application);
