<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Menu extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
	}
	public function Index()
	{
		$data['title'] = 'Menu Management';
		$data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

		$data['menu'] = $this->db->get('user_menu')->result_array();

		$this->form_validation->set_rules('menu', 'Menu', 'required');

		if ($this->form_validation->run() == FALSE) {
			$this->load->view('templates/header', $data);
			$this->load->view('templates/sidebar', $data);
			$this->load->view('templates/topbar', $data);
			$this->load->view('menu/index', $data);
			$this->load->view('templates/footer');
		} else {
			$this->db->insert('user_menu', ['menu' => $this->input->post('menu')]);
			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">New Menu Added!</div>');
			redirect('menu');
		}
	}
	// function delete
	public function deleteMenu($id)
	{
		$this->db->delete('user_menu', ['id' => $id]);
		$this->session->set_flashdata('delete', '<div class="alert alert-success" role="alert">Data was deleted!</div>');
		redirect('menu');
	}
	public function deleteSubMenu($id)
	{
		$this->db->delete('user_sub_menu', ['id' => $id]);
		$this->session->set_flashdata('delete', '<div class="alert alert-success" role="alert">Data Submenu was deleted!</div>');
		redirect('submenu');
	}
	// function edit
	public function editMenu($id)
	{
		$data['title'] = 'Edit this Menu';
		$data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

		// $data['menu'] = $this->db->get('user_menu', ['menu' => $this->session->userdata('menu')])->row_array();
		$data['menu'] = $this->db->get_where('user_menu', ['id' => $id])->row_array();

		$this->form_validation->set_rules('menu', 'Menu', 'required|trim');


		if ($this->form_validation->run() == false) {
			$this->load->view('templates/header', $data);
			$this->load->view('templates/sidebar', $data);
			$this->load->view('templates/topbar', $data);
			$this->load->view('menu/editmenu', $data);
			$this->load->view('templates/footer');
		} else {
			$data = [
				"id" => $this->input->post('id', true),
				"menu" => $this->input->post('menu', true)
			];

			$this->db->set('user_menu', $this->input->post('user_menu'));
			$this->db->where('id', $this->input->post('id'));
			$this->db->update('user_menu', $data);

			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Your Menu has been updated!</div>');
			redirect('menu');
		}
	}
	public function submenu()
	{
		$data['title'] = 'Submenu Management';
		$data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();
		$this->load->model('Menu_model', 'menu');

		$data['subMenu'] = $this->menu->getsubMenu();
		$data['menu'] = $this->db->get('user_menu')->result_array();

		$this->form_validation->set_rules('title', 'Title', 'required');
		$this->form_validation->set_rules('menu_id', 'Menu', 'required');
		$this->form_validation->set_rules('url', 'URL', 'required');
		$this->form_validation->set_rules('icon', 'icon', 'required');

		if ($this->form_validation->run() == FALSE) {

			$this->load->view('templates/header', $data);
			$this->load->view('templates/sidebar', $data);
			$this->load->view('templates/topbar', $data);
			$this->load->view('menu/submenu', $data);
			$this->load->view('templates/footer');
		} else {
			$data = [
				'title' => $this->input->post('title'),
				'menu_id' => $this->input->post('menu_id'),
				'url' => $this->input->post('url'),
				'icon' => $this->input->post('icon'),
				'is_active' => $this->input->post('is_active'),
			];
			$this->db->insert('user_sub_menu', $data);
			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">New Submenu added!</div>');
			redirect('menu/submenu');
		}
	}
}
