<?php

/**
 * This file is part of the Dataform module for Moodle - http://moodle.org/.
 *
 * @package mod-dataform
 * @subpackage view-import
 * @copyright 2011 Itamar Tzadok
 * @license http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 *
 * The Dataform has been developed as an enhanced counterpart
 * of Moodle's Database activity module (1.9.11+ (20110323)).
 * To the extent that Dataform code corresponds to Database code,
 * certain copyrights on the Database module may obtain.
 *
 * Moodle is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Moodle is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Moodle. If not, see <http://www.gnu.org/licenses/>.
 */

require_once("$CFG->dirroot/mod/dataform/view/view_form.php");

class mod_dataform_view_import_form extends mod_dataform_view_base_form {

    /**
     *
     */
    function view_definition_after_gps() {

        $mform =& $this->_form;

        // settings
        //-------------------------------------------------------------------------------
        $mform->addElement('header', 'listbodyhdr', get_string('settings'));

        // use csv
        $mform->addElement('selectyesno', 'param2', 'Use csv');        

        // fields to import
        $attributes = array('wrap' => 'virtual', 'rows' => 10, 'cols' => 50);
        $mform->addElement('textarea', 'param1', 'Fields to import', $attributes);
        $mform->setDefault('param1', FORMAT_PLAIN);
        $this->add_tags_selector('param1', 'field');
        
    }
    
}
