<?php
class Pages extends CI_Controller {

        public function index()
        {               
                $this->load->model('autoservis_model');
                $data['polozky'] = $this->autoservis_model->get_menu();
		$this->load->view('templates/hlavicka', $data);                
		$this->load->view('pages/domu', $data);  
		$this->load->view('templates/paticka');
	}
                public function home()
        {
           $this->load->model('autoservis_model');
                $data['polozky'] = $this->autoservis_model->get_menu();
                $this->load->view('templates/hlavicka', $data);                
		$this->load->view('pages/domu', $data);  
		$this->load->view('templates/paticka');
        }
}